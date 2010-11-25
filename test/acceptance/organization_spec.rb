require 'test/acceptance/helper'

describe 'Submitting organization' do
  before { driver.navigate.to "http://localhost:3000/organizations/new" }
  
  context 'invalid organization' do
    before { driver.find_element(:id, 'organization_submit').click }

    it 'should validade a new organization' do
      expected_error_messages = ["Name", "Contact", "City", "Country", "Password", "Announcer", "Email"].collect {|field| "#{field} can't be blank"} 
      
      errors_list = driver.find_elements(:xpath => "//div[@id='errorExplanation']/ul/li")  
      displayed_errors_messages = errors_list.collect {|li| li.text}
      
      displayed_errors_messages.sort.should == expected_error_messages.sort
    end
    
    it 'should not show success message' do
      driver.find_elements(:xpath => "//h4[@class='succefulUpdated']").should be_empty
    end
  end

end

