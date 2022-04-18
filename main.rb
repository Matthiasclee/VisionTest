require_relative 'serial.rb'
require 'selenium-webdriver'

# UNCOMMENT FOR WINDOWS:
# Selenium::WebDriver::Firefox.driver_path = 'setup_files/geckodriver.exe'
driver = Selenium::WebDriver.for :firefox
driver.navigate.to 'file://' + Dir.pwd + '/index.html'

oncode '1B' do; driver.execute_script 'fill(cSize, true)' end
oncode '03' do; driver.execute_script 'up()' end
oncode '04' do; driver.execute_script 'down()' end
oncode '17' do; driver.execute_script 'up()' end
oncode '1F' do; driver.execute_script 'down()' end
oncode '1C' do; driver.execute_script 'up()' end
oncode '1A' do; driver.execute_script 'down()' end
oncode '05' do; driver.execute_script 'up()' end
oncode '06' do; driver.execute_script 'down()' end
oncode '07' do; driver.execute_script 'tglLine()' end
oncode '08' do; driver.execute_script 'tglSingle()' end
oncode '0A' do; driver.execute_script 'while (mode != "letter") {tglMode()}' end
oncode '0B' do; driver.execute_script 'while (mode != "number") {tglMode()}' end
oncode '0C' do; driver.execute_script 'while (mode != "symbol") {tglMode()}' end
oncode '0F' do; driver.execute_script 'while (mode != "e") {tglMode()}' end
oncode '41' do; driver.execute_script 'fill(1, false, true)' end
oncode '42' do; driver.execute_script 'fill(3, false, true)' end
oncode '43' do; driver.execute_script 'fill(5, false, true)' end
oncode '45' do; driver.execute_script 'fill(6, false, true)' end
oncode '46' do; driver.execute_script 'fill(8, false, true)' end
oncode '47' do; driver.execute_script 'fill(10, false, true)' end
oncode '49' do; driver.execute_script 'fill(11, false, true)' end
oncode '4A' do; driver.execute_script 'fill(14, false, true)' end
oncode '4B' do; driver.execute_script 'fill(17, false, true)' end
oncode '00' do; driver.execute_script 'screenSaver();' end
oncode '01' do; driver.execute_script 'screenSaver();' end
oncode '02' do; driver.execute_script 'screenSaver();' end

start_listener
