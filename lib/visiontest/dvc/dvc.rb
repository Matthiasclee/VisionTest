require "socket"
require_relative "server.rb"

module VisionTest
  module DVC

  end
end

Thread.new do
  VisionTest::DVC::Server.start
end
