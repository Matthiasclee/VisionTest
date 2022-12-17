module VisionTest
  module FirefoxCtrl
    @driver=nil
    def start_driver
      Selenium::WebDriver::Firefox::Service.driver_path = 'setup_files/geckodriver.exe' if $mode == :win
      options = Selenium::WebDriver::Firefox::Options.new(args: ['--kiosk'])
      @driver = Selenium::WebDriver.for :firefox, capabilities: options
      @driver.navigate.to 'file://' + ROOT_DIR + '/index.html'
    end

    module_function :start_driver
    attr_reader :driver
    module_function :driver
  end
end
