module VisionTest
  module VTAC
    module Server
      @server = nil

      def client_handler(client)
        client.puts Packet.new(:id_server, File.read("#{ROOT_DIR}/lib/visiontest/vtac/id_server").chomp)
        packet = Packet.new(from_packet: client.gets)
        if packet[:type] == "id_client" && packet["contents"] == "vtac_client"
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

      def start(port:5582, host:"0.0.0.0")
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

      module_function :start, :client_handler
    end
  end
end
