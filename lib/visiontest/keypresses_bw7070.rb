module VisionTest
  module KeypressesBW7070
    # Size controls
    Serial.oncode ['bw707057', 'bw707017'] do; FirefoxCtrl.driver.execute_script 'svup()' end
    Serial.oncode ['bw70703F', 'bw70707F'] do; FirefoxCtrl.driver.execute_script 'svdown()' end

    # Skip back
    Serial.oncode ['bw70700F', 'bw70704F'] do
      FirefoxCtrl.driver.execute_script("skip_back()")
    end

    # Skip ahead
    Serial.oncode ['bw7070F7', 'bw7070B7'] do
      FirefoxCtrl.driver.execute_script("skip_ahead()")
    end

    # Play/pause video
    Serial.oncode ['bw707028', 'bw707068'] do
      toggleplaybackcode = "toggle_playback()"
      FirefoxCtrl.driver.execute_script(toggleplaybackcode)
    end

    # Go to video
    Serial.oncode ['bw707030', 'bw707070'] do
      selectedvideo = FirefoxCtrl.driver.execute_script("return getSelectedVideo()")
      getLocationCode = "return document.getElementById(#{selectedvideo}).href"
      location = FirefoxCtrl.driver.execute_script getLocationCode
      FirefoxCtrl.driver.navigate.to location
      FirefoxCtrl.page = location
    end

    # Location controls
    Serial.oncode ['bw70709F', 'bw7070DF'] do
      FirefoxCtrl.driver.navigate.to 'file://' + ROOT_DIR + '/html/table.html'
      FirefoxCtrl.page = "table.html"
    end

    Serial.oncode ['bw7070EF', 'bw7070AF'] do
      FirefoxCtrl.driver.navigate.to 'file://' + ROOT_DIR + '/html/pediatricsvideos.html'
      FirefoxCtrl.page = "pediatricsvideos.html"
    end

  end
end
