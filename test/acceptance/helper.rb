require 'selenium-webdriver'
require 'test/unit'

module SeleniumHelper
  def driver
    @selenium_driver ||= Selenium::WebDriver.for :firefox
  end
end

include SeleniumHelper

