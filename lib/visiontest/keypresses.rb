calibrationmode = false
roomlengthmode = false

def changePxSize(num)
  lines = File.readlines('js/settings.js')
  size_line = lines[1].split(" ")
  size = size_line[2].to_i
  lines[1] = "  localStorage.pxsize = #{size + num}\n"
  File.write('js/settings.js', lines.join)
  VisionTest::FirefoxCtrl.driver.execute_script size + num > size ? 'upPxSize()' : 'downPxSize()'
end

def changeRoomLength(num)
  lines = File.readlines('js/settings.js')
  size_line = lines[7].split(" ")
  size = size_line[2].to_i
  lines[7] = "  localStorage.roomLength = #{size + num}\n"
  File.write('js/settings.js', lines.join)
  VisionTest::FirefoxCtrl.driver.execute_script size + num > size ? 'upRoomLength()' : 'downRoomLength()'
end

def toggleMirror()
  lines = File.readlines('js/settings.js')
  mirror_line = lines[4].split(" ")
  mirrored = mirror_line[2].to_i
  lines[4] = "  localStorage.mirrored = #{mirrored == 0 ? '1' : '0'}\n"
  File.write('js/settings.js', lines.join)
  VisionTest::FirefoxCtrl.driver.execute_script 'toggleMirror()' 
end

VisionTest::Serial.oncode '1B' do; VisionTest::FirefoxCtrl.driver.execute_script 'fill(cSize, true)' end
VisionTest::Serial.oncode '03' do; roomlengthmode ? changeRoomLength(1) : VisionTest::FirefoxCtrl.driver.execute_script('up()') end
VisionTest::Serial.oncode '04' do; roomlengthmode ? changeRoomLength(-1) : VisionTest::FirefoxCtrl.driver.execute_script('down()') end
VisionTest::Serial.oncode '17' do; VisionTest::FirefoxCtrl.driver.execute_script 'up()' end
VisionTest::Serial.oncode '1F' do; VisionTest::FirefoxCtrl.driver.execute_script 'down()' end
VisionTest::Serial.oncode '1C' do; VisionTest::FirefoxCtrl.driver.execute_script 'up()' end
VisionTest::Serial.oncode '1A' do; VisionTest::FirefoxCtrl.driver.execute_script 'down()' end
VisionTest::Serial.oncode '05' do; calibrationmode ? changePxSize(1) : VisionTest::FirefoxCtrl.driver.execute_script('up()') end
VisionTest::Serial.oncode '06' do; calibrationmode ? changePxSize(-1) : VisionTest::FirefoxCtrl.driver.execute_script('down()') end
VisionTest::Serial.oncode '07' do; VisionTest::FirefoxCtrl.driver.execute_script 'tglLine()' end
VisionTest::Serial.oncode '08' do; VisionTest::FirefoxCtrl.driver.execute_script 'tglSingle()' end
VisionTest::Serial.oncode '09' do; VisionTest::FirefoxCtrl.driver.execute_script 'tglSizeNum()' end
VisionTest::Serial.oncode '0A' do; VisionTest::FirefoxCtrl.driver.execute_script 'while (mode != "letter") {tglMode()}' end
VisionTest::Serial.oncode '0B' do; VisionTest::FirefoxCtrl.driver.execute_script 'while (mode != "number") {tglMode()}' end
VisionTest::Serial.oncode '0C' do; VisionTest::FirefoxCtrl.driver.execute_script 'while (mode != "symbol") {tglMode()}' end
VisionTest::Serial.oncode '0F' do; VisionTest::FirefoxCtrl.driver.execute_script 'while (mode != "e") {tglMode()}' end
VisionTest::Serial.oncode '41' do; VisionTest::FirefoxCtrl.driver.execute_script 'fill(1, false, true)' end
VisionTest::Serial.oncode '42' do; VisionTest::FirefoxCtrl.driver.execute_script 'fill(3, false, true)' end
VisionTest::Serial.oncode '43' do; VisionTest::FirefoxCtrl.driver.execute_script 'fill(5, false, true)' end
VisionTest::Serial.oncode '45' do; VisionTest::FirefoxCtrl.driver.execute_script 'fill(6, false, true)' end
VisionTest::Serial.oncode '46' do; VisionTest::FirefoxCtrl.driver.execute_script 'fill(8, false, true)' end
VisionTest::Serial.oncode '47' do; VisionTest::FirefoxCtrl.driver.execute_script 'fill(10, false, true)' end
VisionTest::Serial.oncode '49' do; VisionTest::FirefoxCtrl.driver.execute_script 'fill(11, false, true)' end
VisionTest::Serial.oncode '4A' do; VisionTest::FirefoxCtrl.driver.execute_script 'fill(14, false, true)' end
VisionTest::Serial.oncode '4B' do; VisionTest::FirefoxCtrl.driver.execute_script 'fill(17, false, true)' end
VisionTest::Serial.oncode '00' do; VisionTest::FirefoxCtrl.driver.execute_script 'screenSaver();' end
VisionTest::Serial.oncode '01' do; VisionTest::FirefoxCtrl.driver.execute_script 'screenSaver();' end
VisionTest::Serial.oncode '02' do; VisionTest::FirefoxCtrl.driver.execute_script 'screenSaver();' end

# Calibration

VisionTest::Serial.oncode '44' do
  if $mode == :unix && File.exist?("/media/#{ENV['USER']}/VT/vtcalib")
    VisionTest::FirefoxCtrl.driver.execute_script 'toggleSizeOf20();'
    calibrationmode = !calibrationmode
    VisionTest::FirefoxCtrl.driver.execute_script calibrationmode ? 'fill("calibration")' : 'fill(1, false, true)'
  end
end
VisionTest::Serial.oncode '48' do
  if $mode == :unix && File.exist?("/media/#{ENV['USER']}/VT/vtcalib")
    VisionTest::FirefoxCtrl.driver.execute_script 'toggleRoomLength();'
    roomlengthmode = !roomlengthmode
  end
end

VisionTest::Serial.oncode '4C' do; toggleMirror if $mode == :unix && File.exist?("/media/#{ENV['USER']}/VT/vtcalib") end

