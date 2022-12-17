module VisionTest
  module VTAC
    module Server
      module Commands
        def run(c)
          command = c.split(" ")

          cmd = command[0]
          args = command[1...command.length]
          
          if cmd == "analytics"
            if args[0] == "keypresses"
              if args[1] == "view"
                if args[2]
                  return Packet.new(:response, JSON.parse(File.read("#{ROOT_DIR}/analytics/keypresses.json"))[args[2]])
                else
                  return Packet.new(:response, File.read("#{ROOT_DIR}/analytics/keypresses.json"))
                end
              elsif args[1] == "clear"
                File.write("#{ROOT_DIR}/analytics/keypresses.json", {}.to_json, mode: "w")
                return Packet.new(:response, "Success")
              end
            end
          end
          return Packet.new(:error, "Invalid command")
        end

        module_function :run
      end
    end
  end
end

