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
      driver.find_elements(:xpath => "//h4[@class='successfulUpdated']").should be_empty
    end
  end
  
  context 'organization with invalid mail' do
    before do
      driver.find_element(:xpath => "//input[@name='organization[name]']").send_keys 'Casa da Mae Joana'
      driver.find_element(:xpath => "//input[@name='organization[contact]']").send_keys 'Fulano'
      driver.find_element(:xpath => "//input[@name='organization[city]']").send_keys 'Cidade'
      driver.find_element(:xpath => "//input[@name='organization[country]']").send_keys 'Pais'
      driver.find_element(:xpath => "//input[@name='organization[announcer]']").send_keys 'Cidade'
      driver.find_element(:xpath => "//input[@name='organization[password]']").send_keys 'Cidade'
      driver.find_element(:xpath => "//input[@name='organization[email]']").send_keys 'a'
      driver.find_element(:id, 'organization_submit').click
    end
  
    it 'should preserver input when organization is not valid' do
      driver.find_element(:xpath => "//input[@name='organization[name]']").value.should == 'Casa da Mae Joana'
    end
  
    it 'should tell invalid field' do
      driver.find_elements(:xpath => "//div[@id='errorExplanation']/ul/li").first.text.should == 'Email is invalid'
    end
  
    it 'should not show success message' do
      driver.find_elements(:xpath => "//h4[@class='successfulUpdated']").should be_empty
    end
  end

  it 'should create a valid organization' do
    driver.find_element(:xpath => "//input[@name='organization[name]']").send_keys 'Casa da Mae Joana'
    driver.find_element(:xpath => "//input[@name='organization[contact]']").send_keys 'Fulano'
    driver.find_element(:xpath => "//input[@name='organization[city]']").send_keys 'Cidade'
    driver.find_element(:xpath => "//input[@name='organization[country]']").send_keys 'Pais'
    driver.find_element(:xpath => "//input[@name='organization[announcer]']").send_keys 'Cidade'
    driver.find_element(:xpath => "//input[@name='organization[password]']").send_keys 'Cidade'
    driver.find_element(:xpath => "//input[@name='organization[email]']").send_keys 'a@a.a'
    driver.find_element(:id, 'organization_submit').click
    driver.find_elements(:xpath => "//h4[@class='successfulUpdated']").should_not be_empty
  end
  
end

