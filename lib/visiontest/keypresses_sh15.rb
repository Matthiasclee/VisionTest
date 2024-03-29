module VisionTest
  module KeypressesSH15
    cmode = :ltr

    # Size controls
    Serial.oncode 'sh15A2' do; FirefoxCtrl.driver.execute_script 'up()' end
    Serial.oncode 'sh15A6' do; FirefoxCtrl.driver.execute_script 'down()' end

    # Hide button
    Serial.oncode 'sh15A1' do; FirefoxCtrl.driver.execute_script 'tglSizeNum()' end

    # Screensaver
    Serial.oncode 'sh15A0' do; FirefoxCtrl.driver.execute_script 'screenSaver()' end

    # Randomize letters
    Serial.oncode 'sh15A4' do; FirefoxCtrl.driver.execute_script 'fill(cSize, true)' end

    # Mode buttons
    Serial.oncode 'sh15A3' do
        FirefoxCtrl.driver.execute_script "
          if (mode == 'letter'){nmode = 'e'};
          if (mode == 'number'){nmode = 'letter'};
          if (mode == 'symbol'){nmode = 'number'};
          if (mode == 'e'){nmode = 'symbol'};
          while (mode != nmode) {tglMode()};
        "
    end
    Serial.oncode 'sh15A5' do
        FirefoxCtrl.driver.execute_script "
          if (mode == 'letter'){nmode = 'number'};
          if (mode == 'number'){nmode = 'symbol'};
          if (mode == 'symbol'){nmode = 'e'};
          if (mode == 'e'){nmode = 'letter'};
          while (mode != nmode) {tglMode()};
        "
    end

    # Line
    Serial.oncode 'sh15A7' do; FirefoxCtrl.driver.execute_script 'tglLine()' end

    # SGL
    Serial.oncode 'sh15A8' do; FirefoxCtrl.driver.execute_script 'tglSingle()' end

    # Shortcuts
    Serial.oncode 'sh15A9' do; FirefoxCtrl.driver.execute_script 'fill(3, false, true)' end # 20 line
    Serial.oncode 'sh15AA' do; FirefoxCtrl.driver.execute_script 'fill(5, false, true)' end # 30 line
    Serial.oncode 'sh15AB' do; FirefoxCtrl.driver.execute_script 'fill(6, false, true)' end # 40 line
    Serial.oncode 'sh15AC' do; FirefoxCtrl.driver.execute_script 'fill(8, false, true)' end # 60 line
    Serial.oncode 'sh15AD' do; FirefoxCtrl.driver.execute_script 'fill(10, false, true)' end # 80 line
    Serial.oncode 'sh15AE' do; FirefoxCtrl.driver.execute_script 'fill(14, false, true)' end # 200 line
  end
end
