require 'serialport'
require_relative "settings.rb"

if $mode == :unix
  $ser_port = ENV["receiver_port"] ? ENV["receiver_port"] : (puts "Error";exit)
elsif $mode == :win
  $ser_port = $windows_serial_port
end

$codes = {}

def oncode(code, &block)
  $codes[code.to_sym] = block
end

def start_listener
  ser = SerialPort.new($ser_port, 9600, 8, 1, SerialPort::NONE)

  cdat = ''
  rcvstat = 0 # not started
  loop do
    if cdat.length == 7
      code = cdat[5..6]

      if $codes[code.to_sym]
        $codes[code.to_sym].call
      end

      cdat = ''
    else
      d = ser.read(1)

      if d == "\r"
        ser.read(1)
        cdat = ''
      else
        cdat << d
      end
    end
  end
end
