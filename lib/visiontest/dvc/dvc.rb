require "socket"
require_relative "server.rb"
require_relative "client.rb"
require_relative "packet.rb"

module VisionTest
  module DVC

  end
end

if $dvc_mode == "client"
  host = $ARGV[1]
  port = 5583
  port = ARGV[2].to_i if ARGV[2]
  VisionTest::DVC::Client.connect(host, port: port)
elsif $dvc_mode == "server"
  port = 5583
  port = ARGV[1].to_i if ARGV[1]
  Thread.new {VisionTest::DVC::Server.start(port: port)}
end
