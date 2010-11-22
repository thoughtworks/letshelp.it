require 'acceptance/helper'

class OrganizationTest < Test::Unit::TestCase

  def teardown
    driver.close
  end
  
  def test_new_organization_validation
    expected_error_messages = [
      "Name can't be blank", 
      "Contact can't be blank", 
      "City can't be blank",
      "Country can't be blank",
      "Password can't be blank",
      "Announcer can't be blank", 
      "Email can't be blank"]
  
    driver.navigate.to "http://localhost:3000/organizations/new"
    driver.find_element(:id, 'organization_submit').click    
    
    errors_list = driver.find_elements(:xpath => "//div[@id='errorExplanation']/ul/li")  
    displayed_errors_messages = errors_list.collect {|li| li.text}
      
    assert_equal expected_error_messages.sort, displayed_errors_messages.sort
  end
  
end

