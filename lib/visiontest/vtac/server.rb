module VisionTest
  module VTAC
    module Server
      @server = nil

      def self.client_handler(client)
        password_sha256 = File.read("#{ROOT_DIR}/conf/vtac_pw").chomp

        client.puts Packet.new(:id_server, File.read("#{ROOT_DIR}/conf/id_server").chomp + "~v#{::VisionTest.version}" + "#{"~authreq" if (password_sha256 != "")}")
        packet = Packet.new(from_packet: client.gets)
        if packet[:type] == "id_client"
          if password_sha256 != ""
            packet = Packet.new(from_packet: client.gets)

            if packet[:type] == "password"
              sha256 = Digest::SHA256.hexdigest packet[:contents]

              if sha256 != password_sha256
                client.puts Packet.new(:error, "BAD_PASSWORD")
                client.close
              else
                client.puts Packet.new(:response, "AUTH_SUCCESS")
              end
            else
              client.puts Packet.new(:error, "EXPECTED_PASSWORD_PACKET")
              client.close
            end
          end

          loop do
            packet = Packet.new(from_packet: client.gets)
            if packet[:type] == "command"
              client.puts Commands.run(packet[:contents])
            elsif packet[:type] == "error"
              puts "Error: " + packet[:contents]
            else
              client.puts Packet.new(:error, "INVALID_PACKET_TYPE")
            end
          end
        else
          client.close
          return
        end
      end

      def self.start(port:5582, host:"0.0.0.0")
        @server = TCPServer.new(host, port)
        run_server = true

        while run_server
          @client = @server.accept
          begin
            client_handler @client
          rescue

          end
        end
      end
    end
  end
end
