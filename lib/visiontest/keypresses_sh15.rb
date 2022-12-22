module VisionTest
  module KeypressesSH15
    cmode = :ltr

    # Size controls
    Serial.oncode 'A2' do; FirefoxCtrl.driver.execute_script 'up()' end
    Serial.oncode 'A6' do; FirefoxCtrl.driver.execute_script 'down()' end

    # Hide button
    Serial.oncode 'A1' do; FirefoxCtrl.driver.execute_script 'tglSizeNum()' end

    # Screensaver
    Serial.oncode 'A0' do; FirefoxCtrl.driver.execute_script 'screenSaver()' end

    # Randomize letters
    Serial.oncode 'A4' do; FirefoxCtrl.driver.execute_script 'fill(cSize, true)' end

    # Mode buttons
    Serial.oncode 'A3' do
        FirefoxCtrl.driver.execute_script "
          if (mode == 'letter'){nmode = 'e'};
          if (mode == 'number'){nmode = 'letter'};
          if (mode == 'symbol'){nmode = 'number'};
          if (mode == 'e'){nmode = 'symbol'};
          while (mode != nmode) {tglMode()};
        "
    end
    Serial.oncode 'A5' do
        FirefoxCtrl.driver.execute_script "
          if (mode == 'letter'){nmode = 'number'};
          if (mode == 'number'){nmode = 'symbol'};
          if (mode == 'symbol'){nmode = 'e'};
          if (mode == 'e'){nmode = 'letter'};
          while (mode != nmode) {tglMode()};
        "
    end

    # Line
    Serial.oncode 'A7' do; FirefoxCtrl.driver.execute_script 'tglLine()' end

    # SGL
    Serial.oncode 'A8' do; FirefoxCtrl.driver.execute_script 'tglSingle()' end

    # Shortcuts
    Serial.oncode '41' do; FirefoxCtrl.driver.execute_script 'fill(1, false, true)' end
    Serial.oncode '42' do; FirefoxCtrl.driver.execute_script 'fill(3, false, true)' end
    Serial.oncode '43' do; FirefoxCtrl.driver.execute_script 'fill(5, false, true)' end
    Serial.oncode '45' do; FirefoxCtrl.driver.execute_script 'fill(6, false, true)' end
    Serial.oncode '46' do; FirefoxCtrl.driver.execute_script 'fill(8, false, true)' end
    Serial.oncode '47' do; FirefoxCtrl.driver.execute_script 'fill(10, false, true)' end
    Serial.oncode '49' do; FirefoxCtrl.driver.execute_script 'fill(11, false, true)' end
    Serial.oncode '4A' do; FirefoxCtrl.driver.execute_script 'fill(14, false, true)' end
    Serial.oncode '4B' do; FirefoxCtrl.driver.execute_script 'fill(17, false, true)' end
  end
end
