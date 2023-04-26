module VisionTest
  module FirefoxCtrl
    @driver=nil
    def self.start_driver
      options = Selenium::WebDriver::Firefox::Options.new(args: ['--kiosk'])
      @driver = Selenium::WebDriver.for :firefox, options: options
      @driver.navigate.to 'file://' + ROOT_DIR + '/html/table.html'
    end

    attr_reader :driver
    module_function :driver
  end
end
