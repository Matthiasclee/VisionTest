module VisionTest
  module Serial
    @sc_45_beginning = "N00FF"
    @sh_15_beginning = "N708F"
    @bw_7070_beginning = "B6A"

    @remote_names = {
      "N00FF" => "sc45",
      "N708F" => "sh15",
      "B6A" => "bw7070"
    }

    if ARGV[0] != "--vtac-client"
      @ser_port = ENV["receiver_port"] ? ENV["receiver_port"] : (STDERR.puts "VisionTest: receiver_port not set";exit(1))
    end

    @codes = {}

    def self.oncode(code, &block)
      if code.class == Array
        code.each do |c|
          @codes[c.to_sym] = block
        end
      else
        @codes[code.to_sym] = block
      end
    end

    def self.start_listener
      ser = SerialPort.new(@ser_port, 9600, 8, 1, SerialPort::NONE)

      cdat = ''
      complete_transmission = false
      rcvstat = 0 # not started
      last_sh15_keypress = DateTime.now.strftime('%Q').to_i - 2
      loop do
        if complete_transmission
          code = cdat[-2..-1]
          remote_id = cdat[0..-3]
          call = false
          call = true if remote_id == @sc_45_beginning
          
          if remote_id == @sh_15_beginning || remote_id == @bw_7070_beginning
            if DateTime.now.strftime('%Q').to_i - last_sh15_keypress > 200
              call = true
              last_sh15_keypress = DateTime.now.strftime('%Q').to_i
            end
          end 

          code = "#{@remote_names[remote_id]}#{code}"

          if @codes[code.to_sym] && call
            fork{Analytics.record_keypress_analytics code}
            begin
              @codes[code.to_sym].call
            rescue => e
              STDERR;puts "VisionTest: Error: #{e.message}"
            end
          end

          cdat = ''
          complete_transmission = false
        else
          d = ser.read(1)

          if d == "\r"
            ser.read(1)
            if cdat == "N!"
              cdat = ''
            else
              complete_transmission = true
            end
          else
            cdat << d
          end
        end
      end
    end
    
    attr_accessor :codes
    module_function :codes
  end
end
