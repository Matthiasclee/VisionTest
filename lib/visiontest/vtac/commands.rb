module VisionTest
  module VTAC
    module Server
      module Commands
        def self.run(c)
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
          elsif cmd == "config"
            if args[0] == "pxsize"
              if args[1]
                lines = File.readlines("#{ROOT_DIR}js/settings.js")
                size_line = lines[1].split(" ")
                size = size_line[2].to_i
                lines[1] = "  localStorage.pxsize = #{args[1].to_i}\n"
                File.write("#{ROOT_DIR}js/settings.js", lines.join)
                ret = "Success"
              else
                lines = File.readlines("#{ROOT_DIR}js/settings.js")
                size_line = lines[1].split(" ")
                ret = size_line[2]
              end
            elsif args[0] == "roomlength"
              if args[1]
                lines = File.readlines("#{ROOT_DIR}js/settings.js")
                size_line = lines[7].split(" ")
                size = size_line[2].to_i
                lines[7] = "  localStorage.roomLength = #{args[1].gsub(".", "").to_i}\n"
                File.write("#{ROOT_DIR}js/settings.js", lines.join)
                ret = "Success"
              else
                lines = File.readlines("#{ROOT_DIR}js/settings.js")
                size_line = lines[7].split(" ")
                ret = (size_line[2].to_f/10.0).to_s
              end
            elsif args[0] == "mirrored"
              if args[1] == "toggle"
                lines = File.readlines("#{ROOT_DIR}js/settings.js")
                mirror_line = lines[4].split(" ")
                mirrored = mirror_line[2].to_i
                lines[4] = "  localStorage.mirrored = #{mirrored == 0 ? '1' : '0'}\n"
                File.write("#{ROOT_DIR}js/settings.js", lines.join)
                ret = "Success"
              else
                lines = File.readlines("#{ROOT_DIR}js/settings.js")
                mirror_line = lines[4].split(" ")
                ret = mirror_line[2]
              end
            end

            return Packet.new(:response, ret) if defined?("ret") 
          elsif cmd == "name"
            File.write("#{ROOT_DIR}/lib/visiontest/vtac/id_server", args[0], mode: "w")
            return Packet.new(:response, "Success")
          elsif cmd == "reboot"
            `shutdown -r 0`
            return Packet.new(:disconnect, "Reboot")
          elsif cmd == "shutdown"
            `shutdown -P 0`
            return Packet.new(:disconnect, "Shut down")
          elsif cmd == "update"
            out = `cd #{ROOT_DIR};git pull`
            return Packet.new(:response, out)
          end
          return Packet.new(:error, "Invalid command")
        end
      end
    end
  end
end

