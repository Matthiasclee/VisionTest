module VisionTest
  ROOT_DIR=File.expand_path("#{$from_main_rb ? "." : ".."}", Dir.pwd)+"/"
end
require "json"
require "serialport"
require "selenium-webdriver"
require_relative "visiontest/settings.rb"
require_relative "visiontest/calibration.rb"
require_relative "visiontest/serial.rb"
require_relative "visiontest/analytics.rb"
require_relative "visiontest/keypresses.rb"
require_relative "visiontest/firefoxctrl.rb"

if ARGV[0] == "server"
  require_relative "visiontest/vtac/vtac.rb"
else
  VisionTest::FirefoxCtrl.start_driver
  VisionTest::Serial.start_listener
end
