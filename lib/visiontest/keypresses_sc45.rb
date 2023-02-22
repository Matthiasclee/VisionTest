module VisionTest
  module KeypressesSC45
    calibrationmode = false
    roomlengthmode = false

    Serial.oncode 'sc451B' do; FirefoxCtrl.driver.execute_script 'fill(cSize, true)' end
    Serial.oncode 'sc4503' do; roomlengthmode ? Calibration.changeRoomLength(1) : FirefoxCtrl.driver.execute_script('up()') end
    Serial.oncode 'sc4504' do; roomlengthmode ? Calibration.changeRoomLength(-1) : FirefoxCtrl.driver.execute_script('down()') end
    Serial.oncode 'sc4517' do; FirefoxCtrl.driver.execute_script 'up()' end
    Serial.oncode 'sc451F' do; FirefoxCtrl.driver.execute_script 'down()' end
    Serial.oncode 'sc451C' do; FirefoxCtrl.driver.execute_script 'up()' end
    Serial.oncode 'sc451A' do; FirefoxCtrl.driver.execute_script 'down()' end
    Serial.oncode 'sc4505' do; calibrationmode ? Calibration.changePxSize(1) : FirefoxCtrl.driver.execute_script('up()') end
    Serial.oncode 'sc4506' do; calibrationmode ? Calibration.changePxSize(-1) : FirefoxCtrl.driver.execute_script('down()') end
    Serial.oncode 'sc4507' do; FirefoxCtrl.driver.execute_script 'tglLine()' end
    Serial.oncode 'sc4508' do; FirefoxCtrl.driver.execute_script 'tglSingle()' end
    Serial.oncode 'sc4509' do; FirefoxCtrl.driver.execute_script 'tglSizeNum()' end
    Serial.oncode 'sc450A' do; FirefoxCtrl.driver.execute_script 'while (mode != "letter") {tglMode()}' end
    Serial.oncode 'sc450B' do; FirefoxCtrl.driver.execute_script 'while (mode != "number") {tglMode()}' end
    Serial.oncode 'sc450C' do; FirefoxCtrl.driver.execute_script 'while (mode != "symbol") {tglMode()}' end
    Serial.oncode 'sc450F' do; FirefoxCtrl.driver.execute_script 'while (mode != "e") {tglMode()}' end
    Serial.oncode 'sc4541' do; FirefoxCtrl.driver.execute_script 'fill(1, false, true)' end
    Serial.oncode 'sc4542' do; FirefoxCtrl.driver.execute_script 'fill(3, false, true)' end
    Serial.oncode 'sc4543' do; FirefoxCtrl.driver.execute_script 'fill(5, false, true)' end
    Serial.oncode 'sc4545' do; FirefoxCtrl.driver.execute_script 'fill(6, false, true)' end
    Serial.oncode 'sc4546' do; FirefoxCtrl.driver.execute_script 'fill(8, false, true)' end
    Serial.oncode 'sc4547' do; FirefoxCtrl.driver.execute_script 'fill(10, false, true)' end
    Serial.oncode 'sc4549' do; FirefoxCtrl.driver.execute_script 'fill(11, false, true)' end
    Serial.oncode 'sc454A' do; FirefoxCtrl.driver.execute_script 'fill(14, false, true)' end
    Serial.oncode 'sc454B' do; FirefoxCtrl.driver.execute_script 'fill(17, false, true)' end
    Serial.oncode 'sc4500' do; FirefoxCtrl.driver.execute_script 'screenSaver();' end
    Serial.oncode 'sc4501' do; FirefoxCtrl.driver.execute_script 'screenSaver();' end
    Serial.oncode 'sc4502' do; FirefoxCtrl.driver.execute_script 'screenSaver();' end

    # Calibration

    Serial.oncode 'sc4544' do
      if File.exist?("/media/#{ENV['USER']}/VT/vtcalib")
        FirefoxCtrl.driver.execute_script 'toggleSizeOf20();'
        calibrationmode = !calibrationmode
        FirefoxCtrl.driver.execute_script calibrationmode ? 'fill("calibration")' : 'fill(1, false, true)'
      end
    end
    Serial.oncode 'sc4548' do
      if File.exist?("/media/#{ENV['USER']}/VT/vtcalib")
        FirefoxCtrl.driver.execute_script 'toggleRoomLength();'
        roomlengthmode = !roomlengthmode
      end
    end

    Serial.oncode 'sc454C' do; Calibration.toggleMirror if File.exist?("/media/#{ENV['USER']}/VT/vtcalib") end
  end
end
