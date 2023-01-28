require "socket"
require "json"
require "digest"
require_relative "packet.rb"
require_relative "client.rb"
require_relative "commands.rb"
require_relative "server.rb"

module VisionTest
  module VTAC

  end
end

if $vtac_mode == "client"
  host = $ARGV[1]
  port = 5582
  port = ARGV[2].to_i if ARGV[2]
  VisionTest::VTAC::Client.connect(host, port: port)
elsif $vtac_mode == "server"
  port = 5582
  port = ARGV[1].to_i if ARGV[1]
  VisionTest::VTAC::Server.start(port: port)
end
