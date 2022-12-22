module VisionTest
  module KeypressesSH15
    # Size controls
    Serial.oncode 'A2' do; FirefoxCtrl.driver.execute_script 'up()' end
    Serial.oncode 'A6' do; FirefoxCtrl.driver.execute_script 'down()' end

    # Mode button
    Serial.oncode 'A1' do; FirefoxCtrl.driver.execute_script 'tglMode()' end

    # Screensaver
    Serial.oncode 'A0' do; FirefoxCtrl.driver.execute_script 'screenSaver()' end

    # Randomize letters
    Serial.oncode 'A4' do; FirefoxCtrl.driver.execute_script 'fill(cSize, true)'
  end
end
