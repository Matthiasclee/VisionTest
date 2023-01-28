module VisionTest
  ROOT_DIR=File.expand_path("#{$from_main_rb ? "." : ".."}", Dir.pwd)+"/"

  def self.version
    "0.0.3-a"
  end
end
require "json"
require "serialport"
require "selenium-webdriver"
require "date"
require_relative "visiontest/settings.rb"
require_relative "visiontest/calibration.rb"
require_relative "visiontest/serial.rb"
require_relative "visiontest/analytics.rb"
require_relative "visiontest/keypresses_sc45.rb"
require_relative "visiontest/keypresses_sh15.rb"
require_relative "visiontest/firefoxctrl.rb"

if ARGV[0] == "--vtac-server"
  $vtac_mode = "server"
  require_relative "visiontest/vtac/vtac.rb"
elsif ARGV[0] == "--vtac-client"
  $vtac_mode = "client"
  require_relative "visiontest/vtac/vtac.rb"
else
  VisionTest::FirefoxCtrl.start_driver
  VisionTest::Serial.start_listener
end
