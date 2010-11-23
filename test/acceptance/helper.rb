require 'selenium-webdriver'
require 'spec'

module SeleniumHelper
  def driver
    @selenium_driver ||= Selenium::WebDriver.for :firefox
  end
end

include SeleniumHelper

