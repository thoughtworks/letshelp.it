require 'selenium-webdriver'
require 'spec'

module SeleniumHelper
  def driver
    @selenium_driver ||= Selenium::WebDriver.for :firefox
  end
end

Spec::Runner.configure do |config|
  config.after(:each) { driver.close }
  config.include SeleniumHelper
end

