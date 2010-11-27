require 'spec_helper'
describe 'Submitting organization' do
  before { visit "/organizations/new" }

  context 'invalid organization' do
    before { find('#organization_submit').click }

    it 'should validade a new organization' do
      expected_error_messages = ["Name", "Contact", "City", "Country", "Password", "Announcer", "Email"].collect {|field| "#{field} can't be blank"}
      displayed_errors_messages = all(:xpath, "//div[@id='errorExplanation']/ul/li").collect {|field| field.text }

      displayed_errors_messages.sort.should == expected_error_messages.sort
    end

    it 'should not show success message' do
      page.should_not have_xpath "//h4[@class='successfulUpdated']"
    end
  end

  context 'organization with invalid mail' do
    before do
      fill_in 'organization[name]', :with => 'Casa da Mae Joana'
      fill_in 'organization[contact]', :with => 'Fulano'
      fill_in 'organization[city]', :with => 'Cidade'
      fill_in 'organization[country]', :with => 'País'
      fill_in 'organization[announcer]', :with => 'Announcer'
      fill_in 'organization[password]', :with => 'password'
      fill_in 'organization[email]', :with => 'a'

      click_button 'organization_submit'
    end

    it 'should preserver input when organization is not valid' do
      find(:xpath, "//input[@name='organization[name]']").value.should == 'Casa da Mae Joana'
    end

    it 'should tell invalid field' do
      all(:xpath, "//div[@id='errorExplanation']/ul/li").first.text.should =~ /Email(.*)invalid/
    end

    it 'should not show success message' do
      page.should_not have_xpath "//h4[@class='successfulUpdated']"
    end
  end

  it 'should create a valid organization' do
    fill_in 'organization[name]', :with => 'Casa da Mae Joana'
    fill_in 'organization[contact]', :with => 'Fulano'
    fill_in 'organization[city]', :with => 'Cidade'
    fill_in 'organization[country]', :with => 'País'
    fill_in 'organization[announcer]', :with => 'Announcer'
    fill_in 'organization[password]', :with => 'password'
    fill_in 'organization[email]', :with => 'a@a.com'
    click_button 'organization_submit'
    page.should have_xpath "//h4[@class='successfulUpdated']"
  end

end

describe 'Editing organization' do

  it 'should validate wrong password' do
    #create organization to edit
    visit "/organizations/new" 
    fill_in 'organization[name]', :with => 'Casa da Mae Joana'
    fill_in 'organization[contact]', :with => 'Fulano'
    fill_in 'organization[city]', :with => 'Cidade'
    fill_in 'organization[country]', :with => 'País'
    fill_in 'organization[announcer]', :with => 'Announcer'
    fill_in 'organization[password]', :with => 'password'
    fill_in 'organization[email]', :with => 'a@a.com'
    click_button 'organization_submit'
  
    #try to edit 
    visit "/"
    find(:xpath, "//div/h3").click
    click_link 'Edit'  
    fill_in 'pass_field', :with => 'XXX'
    click_button 'Validate'
    has_content? 'Invalid password'
  end

  it 'should validate empty password' do
    #create organization to edit
    visit "/organizations/new" 
    fill_in 'organization[name]', :with => 'Casa da Mae Joana'
    fill_in 'organization[contact]', :with => 'Fulano'
    fill_in 'organization[city]', :with => 'Cidade'
    fill_in 'organization[country]', :with => 'País'
    fill_in 'organization[announcer]', :with => 'Announcer'
    fill_in 'organization[password]', :with => 'password'
    fill_in 'organization[email]', :with => 'a@a.com'
    click_button 'organization_submit'
  
    #try to edit 
    visit "/"
    find(:xpath, "//div/h3").click
    click_link 'Edit'  
    click_button 'Validate'
    has_content? 'Invalid password'
  end  

  it 'should validate correct password' do
    #create organization to edit
    visit "/organizations/new" 
    fill_in 'organization[name]', :with => 'Casa da Mae Joana'
    fill_in 'organization[contact]', :with => 'Fulano'
    fill_in 'organization[city]', :with => 'Cidade'
    fill_in 'organization[country]', :with => 'País'
    fill_in 'organization[announcer]', :with => 'Announcer'
    fill_in 'organization[password]', :with => 'password'
    fill_in 'organization[email]', :with => 'a@a.com'
    click_button 'organization_submit'
  
    #try to edit 
    visit "/"
    find(:xpath, "//div/h3").click
    click_link 'Edit'  
    fill_in 'pass_field', :with => 'senha'
    click_button 'Validate'
    has_content? 'Casa da Mae Joana'
  end  

end

