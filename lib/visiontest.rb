module VisionTest
  ROOT_DIR=File.expand_path("#{$from_main_rb ? "." : ".."}", Dir.pwd)+"/"

  def self.version
    "0.2.5-a"
  end
end

ivtver_file = Dir.home + "/.ivtver"

prev_vt_ver = :none
if !File.exist?(ivtver_file)
  prev_vt_ver = nil
  File.write(ivtver_file, VisionTest.version, mode: "w")
elsif File.read(ivtver_file).chomp != VisionTest.version
  prev_vt_ver = File.read(ivtver_file)
  File.write(ivtver_file, VisionTest.version, mode: "w")
end

require "json"
require "serialport"
require "selenium-webdriver"
require "date"
require_relative "visiontest/calibration.rb"
require_relative "visiontest/serial.rb"
require_relative "visiontest/analytics.rb"
require_relative "visiontest/keypresses_sc45.rb"
require_relative "visiontest/keypresses_sh15.rb"
require_relative "visiontest/keypresses_bw7070.rb"
require_relative "visiontest/firefoxctrl.rb"

if ARGV[0] == "--vtac-server"
  $vtac_mode = "server"
  require_relative "visiontest/vtac/vtac.rb"
elsif ARGV[0] == "--vtac-client"
  $vtac_mode = "client"
  require_relative "visiontest/vtac/vtac.rb"
elsif ARGV[0] == "--dvc-client"
  $dvc_mode = "client"
  require_relative "visiontest/dvc/dvc.rb"
else
  dvcenable = File.read(VisionTest::ROOT_DIR + "/conf/dvcenable").chomp

  if dvcenable == "true"
    $dvc_mode = "server"
    require_relative "visiontest/dvc/dvc.rb"
  end

  begin
    VisionTest::FirefoxCtrl.start_driver
    VisionTest::Serial.start_listener unless ENV['receiver_port'] == "noserial"
    if ENV['receiver_port'] == "noserial"
      STDOUT.puts "VisionTest: Running with no serial port"
      loop do
      end
    end
  rescue Interrupt
    STDOUT.puts "Exiting..."
    VisionTest::FirefoxCtrl.driver.close
    exit 0
  end
end
