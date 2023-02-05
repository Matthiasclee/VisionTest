module VisionTest
  module FirefoxCtrl
    @driver=nil
    def self.start_driver
      Selenium::WebDriver::Firefox::Service.driver_path = 'setup_files/geckodriver.exe' if $mode == :win
      options = Selenium::WebDriver::Firefox::Options.new(args: ['--kiosk'])
      @driver = Selenium::WebDriver.for :firefox, capabilities: options
      @driver.navigate.to 'file://' + ROOT_DIR + '/table.html'
    end

    attr_reader :driver
    module_function :driver
  end
end
