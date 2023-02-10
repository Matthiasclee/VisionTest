module VisionTest
  module DVC
    module Client
      def self.connect(host, port:5583)
        server = TCPSocket.open(host, port)

        packet = Packet.new(from_packet: server.gets)
        if packet[:type] == "id_server"
          server_id = packet[:contents].split("~")
          server_name = server_id[0]
          server_version = server_id[1] ? server_id[1] : "(pre-0.0.2)"
          auth_required = (server_id[2] == "authreq") ? true : false
          server.puts Packet.new(:id_client, "dvc_client")

          if auth_required
            print "Password: "
            server.puts Packet.new(:password, STDIN.gets.chomp)

            response = Packet.new(from_packet: server.gets)

            if response[:type] == "error"
              STDERR.puts "ERROR: " + response[:contents]
              exit 1
            end
          end

          sock_domain, remote_port, remote_hostname, remote_ip = server.peeraddr

          puts "Connected to #{server_name}@#{remote_ip}. Server version: #{server_version}"

          mode = :javascript
          loop do
            print "#{server_name}@#{remote_ip}:[DVC-#{mode}]> "
            command = STDIN.gets.chomp
            if command == "exit"
              server.close
              exit
            elsif command == "__mode:javascript"
              mode = :javascript
              next
            elsif command == "__mode:action"
              mode = :action
              next
            elsif command == ""
              next
            end
            server.puts Packet.new(mode, command)
            packet = Packet.new(from_packet: server.gets)
            if packet[:type] == "response"
              puts packet[:contents]
            elsif packet[:type] == "error"
              STDERR.puts "ERROR: " + packet[:contents]
            elsif packet[:type] == "disconnect"
              puts "Disconnecting: " + packet[:contents]
              server.close
              exit
            else
              server.puts Packet.new(:error, "INVALID_PACKET_TYPE")
            end
          end
        else
          server.close
          return
        end
      end
    end
  end
end

