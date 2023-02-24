module VisionTest
  module Calibration
    def self.changePxSize(num)
      lines = File.readlines("#{ROOT_DIR}conf/settings.js")
      size_line = lines[1].split(" ")
      size = size_line[2].to_i
      lines[1] = "  localStorage.pxsize = #{size + num}\n"
      File.write("#{ROOT_DIR}conf/settings.js", lines.join)
      FirefoxCtrl.driver.execute_script size + num > size ? 'upPxSize()' : 'downPxSize()'
    end

    def self.changeRoomLength(num)
      lines = File.readlines("#{ROOT_DIR}conf/settings.js")
      size_line = lines[7].split(" ")
      size = size_line[2].to_i
      lines[7] = "  localStorage.roomLength = #{size + num}\n"
      File.write("#{ROOT_DIR}conf/settings.js", lines.join)
      FirefoxCtrl.driver.execute_script size + num > size ? 'upRoomLength()' : 'downRoomLength()'
    end

    def self.toggleMirror()
      lines = File.readlines("#{ROOT_DIR}conf/settings.js")
      mirror_line = lines[4].split(" ")
      mirrored = mirror_line[2].to_i
      lines[4] = "  localStorage.mirrored = #{mirrored == 0 ? '1' : '0'}\n"
      File.write("#{ROOT_DIR}conf/settings.js", lines.join)
      FirefoxCtrl.driver.execute_script 'toggleMirror()' 
    end
  end
end
