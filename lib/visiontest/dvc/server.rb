module VisionTest
  module DVC
    module Server
      def self.start(port:5583, host:"0.0.0.0")
        @server = TCPServer.new(host, port)
        run_server = true

        while run_server
          @client = @server.accept
          begin
            scr = @client.gets
            puts scr
            ::VisionTest::FirefoxCtrl.driver.execute_script scr
          rescue

          end
        end
      end
    end
  end
end
