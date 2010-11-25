require 'test/acceptance/helper'

describe 'Submitting organization' do
  before { driver.navigate.to "http://localhost:3000/organizations/new" }

  it 'should validade a new organization' do
    expected_error_messages = ["Name", "Contact", "City", "Country", "Password", "Announcer", "Email"].collect {|field| "#{field} can't be blank"} 
  
    driver.find_element(:id, 'organization_submit').click    
    
    errors_list = driver.find_elements(:xpath => "//div[@id='errorExplanation']/ul/li")  
    displayed_errors_messages = errors_list.collect {|li| li.text}
    
    displayed_errors_messages.sort.should == expected_error_messages.sort
  end

end

