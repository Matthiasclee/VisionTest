module VisionTest
  module FirefoxCtrl
    @driver=nil
    @page = "table.html"
    def self.start_driver
      options = Selenium::WebDriver::Firefox::Options.new(args: ['--kiosk'])
      options.add_preference('media.autoplay.default', 0) # Allow all autoplay
      options.add_preference('media.autoplay.allow-muted', true) # Allow muted autoplay
      options.add_preference('media.autoplay.blocking_policy', 0) # Adjust blocking policy
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
