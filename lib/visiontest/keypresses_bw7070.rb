module VisionTest
  module KeypressesBW7070
    # Size controls
    Serial.oncode ['bw707057', 'bw707017'] do; FirefoxCtrl.driver.execute_script 'up()' end
    Serial.oncode ['bw70703F', 'bw70707F'] do; FirefoxCtrl.driver.execute_script 'down()' end

    # Hide button
    Serial.oncode ['bw7070F7', 'bw7070B7'] do; FirefoxCtrl.driver.execute_script 'tglSizeNum()' end

    # Randomize letters
    Serial.oncode ['bw70700F', 'bw70704F'] do; FirefoxCtrl.driver.execute_script 'fill(cSize, true)' end

    # Mode buttons
    Serial.oncode ['bw7070EF', 'bw7070AF'] do; FirefoxCtrl.driver.execute_script 'tglMode()' end

    # Line
    Serial.oncode ['bw707028', 'bw707068'] do; FirefoxCtrl.driver.execute_script 'tglLine()' end

    # SGL
    Serial.oncode ['bw707030', 'bw707070'] do; FirefoxCtrl.driver.execute_script 'tglSingle()' end

    # Location controls
    Serial.oncode ['bw70709F', 'bw7070DF'] do
      if FirefoxCtrl.page == "table.html"
        FirefoxCtrl.driver.navigate.to 'file://' + ROOT_DIR + '/html/pediatricsvideos.html'
        FirefoxCtrl.page = "pediatricsvideos.html"
      elsif FirefoxCtrl.page == "pediatricsvideos.html"
        FirefoxCtrl.driver.navigate.to 'file://' + ROOT_DIR + '/html/table.html'
        FirefoxCtrl.page = "table.html"
      end
    end

  end
end

