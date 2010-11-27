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
      find(:xpath, "//div[@id='errorExplanation']/ul/li").text.should =~ /Email(.*)invalid/
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
before(:each) do
  visit "/organizations/new"
  fill_in 'organization[name]', :with => 'Casa da Mae Joana'
  fill_in 'organization[contact]', :with => 'Fulano'
  fill_in 'organization[city]', :with => 'Cidade'
  fill_in 'organization[country]', :with => 'País'
  fill_in 'organization[announcer]', :with => 'Announcer'
  fill_in 'organization[password]', :with => 'password'
  fill_in 'organization[email]', :with => 'a@a.com'
  click_button 'organization_submit'
  visit "/"
end

  it 'should validate wrong password' do

    find(:xpath, "//div[@class='wrapper featuredOrg']/a/div").click
    click_link 'Edit'
    fill_in 'pass_field', :with => 'XXX'
    click_button 'Validate'
    has_content? 'Invalid password'
  end

  it 'should validate empty password' do
    find(:xpath, "//div[@class='wrapper featuredOrg']/a/div").click
    click_link 'Edit'
    click_button 'Validate'
    has_content? 'Invalid password'
  end

  it 'should validate correct password' do
    find(:xpath, "//div[@class='wrapper featuredOrg']/a/div").click
    click_link 'Edit'
    fill_in 'pass_field', :with => 'senha'
    click_button 'Validate'
    has_content? 'Casa da Mae Joana'
  end

  it 'should edit organization' do
    find(:xpath, "//div[@class='wrapper featuredOrg']/a/div").click
    click_link 'Edit'
    fill_in 'pass_field', :with => 'password'
    click_button 'Validate'
    fill_in 'organization[city]', :with => 'Tangamandapio'
    find_field 'organization[city]'
    click_button 'organization_submit'
    page.should have_xpath "//h4[@class='successfulUpdated']"
  end

end

