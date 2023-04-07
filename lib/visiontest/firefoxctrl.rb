module VisionTest
  module FirefoxCtrl
    @driver=nil
    def self.start_driver
      user_agent = 'Mozilla/5.0 (SMART-TV; Linux) AppleWebkit/605.1.15 (KHTML, like Gecko) SamsungBrowser/9.2 TV Sa'
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile['general.useragent.override'] = user_agent
      options = Selenium::WebDriver::Firefox::Options.new(args: ['--kiosk'], profile: profile)
      @driver = Selenium::WebDriver.for :firefox, capabilities: options
      @driver.navigate.to 'file://' + ROOT_DIR + '/table.html'
    end

    attr_reader :driver
    module_function :driver
  end
end
