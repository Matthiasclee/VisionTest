require "socket"
require_relative "server.rb"
require_relative "client.rb"
require_relative "packet.rb"

module VisionTest
  module DVC

  end
end

Thread.new do
  VisionTest::DVC::Server.start
end
