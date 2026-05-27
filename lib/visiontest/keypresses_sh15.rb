module VisionTest
  module KeypressesSH15
    active_video_re = /.*html\/playvideo.html\#video[0-9]+\.mp4/
    programming_mode = :off
    #                  :calibration
    #                  :roomlength

    Serial.oncode 'sh15A8' do
      `amixer set Master on`
      `amixer sset Master 2%+`
    end

    Serial.oncode 'sh15A7' do
      `amixer set Master on`
      `amixer sset Master 2%-`
    end

    # Size controls
    Serial.oncode 'sh15A2' do
      case FirefoxCtrl.page
      when "table.html"
        case programming_mode
        when :calibration
          Calibration.changePxSize(1)
        when :roomlength
          Calibration.changeRoomLength(1)
        else
          FirefoxCtrl.driver.execute_script 'up()'
        end
      when "pediatricsvideos.html"
        FirefoxCtrl.driver.execute_script 'svup()'
      end
    end

    Serial.oncode 'sh15A6' do
      case FirefoxCtrl.page
      when "table.html"
        case programming_mode
        when :calibration
          Calibration.changePxSize(-1)
        when :roomlength
          Calibration.changeRoomLength(-1)
        else
          FirefoxCtrl.driver.execute_script 'down()'
        end
      when "pediatricsvideos.html"
        FirefoxCtrl.driver.execute_script 'svdown()'
      end
    end

    # Hide button
    Serial.oncode 'sh15AC' do; FirefoxCtrl.driver.execute_script 'tglSizeNum()' end

    # Middle Button
    Serial.oncode 'sh15A4' do
      case FirefoxCtrl.page
      when "table.html"
        FirefoxCtrl.driver.execute_script(
          "fill(cSize, true)"
        )
      when "pediatricsvideos.html"
        selectedvideo = FirefoxCtrl.driver.execute_script("return getSelectedVideo()")
        getLocationCode = "return document.getElementById(#{selectedvideo}).href"
        location = FirefoxCtrl.driver.execute_script getLocationCode
        FirefoxCtrl.driver.navigate.to location
        FirefoxCtrl.page = location
      when active_video_re
        toggleplaybackcode = "toggle_playback()"
        FirefoxCtrl.driver.execute_script(toggleplaybackcode)
      end
    end

    Serial.oncode 'sh15A1' do
      case FirefoxCtrl.page
      when "table.html"
        FirefoxCtrl.driver.navigate.to 'file://' + ROOT_DIR + '/html/pediatricsvideos.html'
        FirefoxCtrl.page = "pediatricsvideos.html"
      when "pediatricsvideos.html"
        FirefoxCtrl.driver.navigate.to 'file://' + ROOT_DIR + '/html/table.html'
        FirefoxCtrl.page = "table.html"
      when active_video_re
        FirefoxCtrl.driver.navigate.to 'file://' + ROOT_DIR + '/html/pediatricsvideos.html'
        FirefoxCtrl.page = "pediatricsvideos.html"
      end
    end

    # Screensaver
    Serial.oncode 'sh15A0' do; FirefoxCtrl.driver.execute_script 'screenSaver()' end

    # Crowding
    Serial.oncode 'sh15AB' do; FirefoxCtrl.driver.execute_script 'toggleSymCrowd(); fill(cSize)' end

    # Mode buttons
    Serial.oncode 'sh15A3' do
        FirefoxCtrl.driver.execute_script "
          tglModeRev();
        "
    end
    Serial.oncode 'sh15A5' do
        FirefoxCtrl.driver.execute_script "
          tglMode();
        "
    end

    # Line
    Serial.oncode 'sh15A9' do; FirefoxCtrl.driver.execute_script 'tglLine()' end

    # SGL
    Serial.oncode 'sh15AA' do; FirefoxCtrl.driver.execute_script 'tglSingle()' end

    ## Programming
    Serial.oncode 'sh15AD' do
      commands_path = "/media/#{ENV['USER']}/VT/run_commands.vt"

      if File.exist?(commands_path)
        commands = File.read(commands_path).split("\n")
        commands.each {|c| VTAC::Server::Commands.run(c)}
      end
    end

    Serial.oncode 'sh15AE' do
      if File.exist?("/media/#{ENV['USER']}/VT/vtcalib")
        if programming_mode == :off # Enter calibration mode
          programming_mode = :calibration
          FirefoxCtrl.driver.execute_script 'toggleSizeOf20();'
          FirefoxCtrl.driver.execute_script 'fill("calibration")'

        elsif programming_mode == :calibration # Enter roomlength mode
          programming_mode = :roomlength

          FirefoxCtrl.driver.execute_script 'toggleSizeOf20();'
          FirefoxCtrl.driver.execute_script 'fill(1, false, true)'

          FirefoxCtrl.driver.execute_script 'toggleRoomLength();'
        elsif programming_mode == :roomlength # Turn programming off
          programming_mode = :off

          FirefoxCtrl.driver.execute_script 'toggleRoomLength();'
        end
      end
    end
  end
end
