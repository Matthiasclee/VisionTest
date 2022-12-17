require "socket"
require "json"
require_relative "packet.rb"
require_relative "client.rb"
require_relative "commands.rb"
require_relative "server.rb"

module VisionTest
  module VTAC

  end
end

if ARGV[0] == "client"
  VisionTest::VTAC::Client.connect("localhost")
elsif ARGV[0] == "server"
  VisionTest::VTAC::Server.start
end
