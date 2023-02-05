module VisionTest
  module KeypressesSC45
    calibrationmode = false
    roomlengthmode = false

    Serial.oncode '1B' do; FirefoxCtrl.driver.execute_script 'fill(cSize, true)' end
    Serial.oncode '03' do; roomlengthmode ? Calibration.changeRoomLength(1) : FirefoxCtrl.driver.execute_script('up()') end
    Serial.oncode '04' do; roomlengthmode ? Calibration.changeRoomLength(-1) : FirefoxCtrl.driver.execute_script('down()') end
    Serial.oncode '17' do; FirefoxCtrl.driver.execute_script 'up()' end
    Serial.oncode '1F' do; FirefoxCtrl.driver.execute_script 'down()' end
    Serial.oncode '1C' do; FirefoxCtrl.driver.execute_script 'up()' end
    Serial.oncode '1A' do; FirefoxCtrl.driver.execute_script 'down()' end
    Serial.oncode '05' do; calibrationmode ? Calibration.changePxSize(1) : FirefoxCtrl.driver.execute_script('up()') end
    Serial.oncode '06' do; calibrationmode ? Calibration.changePxSize(-1) : FirefoxCtrl.driver.execute_script('down()') end
    Serial.oncode '07' do; FirefoxCtrl.driver.execute_script 'tglLine()' end
    Serial.oncode '08' do; FirefoxCtrl.driver.execute_script 'tglSingle()' end
    Serial.oncode '09' do; FirefoxCtrl.driver.execute_script 'tglSizeNum()' end
    Serial.oncode '0A' do; FirefoxCtrl.driver.execute_script 'while (mode != "letter") {tglMode()}' end
    Serial.oncode '0B' do; FirefoxCtrl.driver.execute_script 'while (mode != "number") {tglMode()}' end
    Serial.oncode '0C' do; FirefoxCtrl.driver.execute_script 'while (mode != "symbol") {tglMode()}' end
    Serial.oncode '0F' do; FirefoxCtrl.driver.execute_script 'while (mode != "e") {tglMode()}' end
    Serial.oncode '41' do; FirefoxCtrl.driver.execute_script 'fill(1, false, true)' end
    Serial.oncode '42' do; FirefoxCtrl.driver.execute_script 'fill(3, false, true)' end
    Serial.oncode '43' do; FirefoxCtrl.driver.execute_script 'fill(5, false, true)' end
    Serial.oncode '45' do; FirefoxCtrl.driver.execute_script 'fill(6, false, true)' end
    Serial.oncode '46' do; FirefoxCtrl.driver.execute_script 'fill(8, false, true)' end
    Serial.oncode '47' do; FirefoxCtrl.driver.execute_script 'fill(10, false, true)' end
    Serial.oncode '49' do; FirefoxCtrl.driver.execute_script 'fill(11, false, true)' end
    Serial.oncode '4A' do; FirefoxCtrl.driver.execute_script 'fill(14, false, true)' end
    Serial.oncode '4B' do; FirefoxCtrl.driver.execute_script 'fill(17, false, true)' end
    Serial.oncode '00' do; FirefoxCtrl.driver.execute_script 'screenSaver();' end
    Serial.oncode '01' do; FirefoxCtrl.driver.execute_script 'screenSaver();' end
    Serial.oncode '02' do; FirefoxCtrl.driver.execute_script 'screenSaver();' end

    # Calibration

    Serial.oncode '44' do
      if File.exist?("/media/#{ENV['USER']}/VT/vtcalib")
        FirefoxCtrl.driver.execute_script 'toggleSizeOf20();'
        calibrationmode = !calibrationmode
        FirefoxCtrl.driver.execute_script calibrationmode ? 'fill("calibration")' : 'fill(1, false, true)'
      end
    end
    Serial.oncode '48' do
      if File.exist?("/media/#{ENV['USER']}/VT/vtcalib")
        FirefoxCtrl.driver.execute_script 'toggleRoomLength();'
        roomlengthmode = !roomlengthmode
      end
    end

    Serial.oncode '4C' do; Calibration.toggleMirror if File.exist?("/media/#{ENV['USER']}/VT/vtcalib") end
  end
end
