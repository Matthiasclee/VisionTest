require_relative 'serial.rb'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.navigate.to 'file://' + Dir.pwd + '/index.html'

oncode '01' do; driver.execute_script 'fill(cSize, true)' end
oncode '03' do; driver.execute_script 'up()' end
oncode '04' do; driver.execute_script 'down()' end
oncode '17' do; driver.execute_script 'up()' end
oncode '1F' do; driver.execute_script 'down()' end
oncode '07' do; driver.execute_script 'tglLine()' end
oncode '08' do; driver.execute_script 'tglSingle()' end
oncode '0A' do; driver.execute_script 'while (mode != "letter") {tglMode()}' end
oncode '0B' do; driver.execute_script 'while (mode != "number") {tglMode()}' end
oncode '0C' do; driver.execute_script 'while (mode != "symbol") {tglMode()}' end
oncode '0F' do; driver.execute_script 'while (mode != "e") {tglMode()}' end
oncode '41' do; driver.execute_script 'fill(1)' end
oncode '42' do; driver.execute_script 'fill(3)' end
oncode '43' do; driver.execute_script 'fill(5)' end
oncode '45' do; driver.execute_script 'fill(6)' end
oncode '46' do; driver.execute_script 'fill(8)' end
oncode '47' do; driver.execute_script 'fill(10)' end
oncode '49' do; driver.execute_script 'fill(11)' end
oncode '4A' do; driver.execute_script 'fill(14)' end
oncode '4B' do; driver.execute_script 'fill(17)' end

start_listener
