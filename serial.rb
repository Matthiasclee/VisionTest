require 'serialport'

$codes = {}

def oncode(code, &block)
  $codes[code.to_sym] = block
end

def start_listener
  ser = SerialPort.new("/dev/tty.usbserial-A107IK35", 9600, 8, 1, SerialPort::NONE)

  cdat = ''
  loop do
    d = ser.readline

    if d[0..1] == 'N!'
      code = cdat.gsub(/[\W]/, "")[5..6].to_s

      if $codes[code.to_sym]
        $codes[code.to_sym].call
      end

      cdat << d[2..d.length-1]
      cdat = ''
    else
      cdat << d
    end
  end
end
