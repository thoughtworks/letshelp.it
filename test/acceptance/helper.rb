require 'selenium-webdriver'
require 'spec'

module SeleniumHelper
  def driver
    @selenium_driver ||= Selenium::WebDriver.for :firefox
  end
end

Spec::Runner.configure do |config|
  config.after(:each) do
    require 'sqlite3'

    db = SQLite3::Database.new "db/development.sqlite3"
    
    db.execute 'delete from organizations_tags'
    db.execute 'delete from organizations'
    db.execute 'delete from slugs'
    
    driver.close
  end
  
  config.include SeleniumHelper
end

