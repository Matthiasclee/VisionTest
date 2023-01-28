module VisionTest
  module VTAC
    module Client
      def self.connect(host, port:5582)
        server = TCPSocket.open(host, port)

        packet = Packet.new(from_packet: server.gets)
        puts packet
        puts packet[:contents]
        puts packet[:type]
        if packet[:type] == "id_server"
          server_id = packet[:contents]
          server.puts Packet.new(:id_client, "vtac_client")
          sock_domain, remote_port, remote_hostname, remote_ip = server.peeraddr
          loop do
            print "#{server_id}@#{remote_ip}:#{remote_port}> "
            command = STDIN.gets.chomp
            if command == "exit"
              server.close
              exit
            end
            server.puts Packet.new(:command, command)
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
