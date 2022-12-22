module VisionTest
  module Serial
    @sc_45_beginning = "N00FF"
    @sh_15_beginning = "N708F"

    if $mode == :unix
      @ser_port = ENV["receiver_port"] ? ENV["receiver_port"] : (puts "Error";exit)
    elsif $mode == :win
      @ser_port = $windows_serial_port
    end

    @codes = {}

    def oncode(code, &block)
      @codes[code.to_sym] = block
    end

    def start_listener
      ser = SerialPort.new(@ser_port, 9600, 8, 1, SerialPort::NONE)

      cdat = ''
      rcvstat = 0 # not started
      last_sh15_keypress = DateTime.now.strftime('%Q').to_i - 2
      loop do
        if cdat.length == 7
          code = cdat[5..6]
          remote_id = cdat[0..4]
          call = false
          call = true if remote_id == @sc_45_beginning
          
          if remote_id == @sh_15_beginning
            if DateTime.now.strftime('%Q').to_i - last_sh15_keypress > 200
              call = true
              last_sh15_keypress = DateTime.now.strftime('%Q').to_i
            end
          end 

          if @codes[code.to_sym] && call
            fork{Analytics.record_keypress_analytics code}
            @codes[code.to_sym].call
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
    module_function :oncode, :start_listener
  end
end
