module VisionTest
  ROOT_DIR=File.expand_path("..", Dir.pwd)
end
require "json"
require "serialport"
require "selenium-webdriver"
require_relative "visiontest/settings.rb"
require_relative "visiontest/serial.rb"
require_relative "visiontest/analytics.rb"
require_relative "visiontest/keypresses.rb"
require_relative "visiontest/firefoxctrl.rb"
VisionTest::FirefoxCtrl.start_driver
VisionTest::Serial.start_listener
