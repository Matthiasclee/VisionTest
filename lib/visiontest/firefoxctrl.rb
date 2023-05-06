module VisionTest
  module FirefoxCtrl
    @driver=nil
    @page = "table.html"
    def self.start_driver
      options = Selenium::WebDriver::Firefox::Options.new(args: ['--kiosk'])
      @driver = Selenium::WebDriver.for :firefox, options: options
      @driver.navigate.to 'file://' + ROOT_DIR + '/html/table.html'
    end

    def self.page=(p)
      @page = p
    end

    attr_reader :driver, :page
    module_function :driver, :page
  end
end
