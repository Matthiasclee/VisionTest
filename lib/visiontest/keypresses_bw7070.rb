module VisionTest
  module KeypressesBW7070
    # Size controls
    Serial.oncode ['bw707057', 'bw707017'] do; FirefoxCtrl.driver.execute_script 'svup()' end
    Serial.oncode ['bw70703F', 'bw70707F'] do; FirefoxCtrl.driver.execute_script 'svdown()' end

    # Play/pause
    Serial.oncode ['bw70700F', 'bw70704F'] do
      playvideocode = "document.getElementsByTagName('video')[0].play()"
      FirefoxCtrl.driver.execute_script(playvideocode)
    end

    Serial.oncode ['bw7070F7', 'bw7070B7'] do
      pausevideocode = "document.getElementsByTagName('video')[0].pause()"
      FirefoxCtrl.driver.execute_script(pausevideocode)
    end

    # Restart video
    Serial.oncode ['bw707028', 'bw707068'] do
      restartvideocode = "document.getElementsByTagName('video')[0].currentTime=0"
      FirefoxCtrl.driver.execute_script(restartvideocode)
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

