require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  
  should validate_presence_of :name  
  should validate_presence_of :contact
  should validate_presence_of :country
  should validate_presence_of :password
  should validate_presence_of :email
  should validate_presence_of :announcer  

  should validate_uniqueness_of :name
 
  test "should return if the given tag is associated to the organization" do
    
    org = organizations(:wwf)
    org.tags = [tags(:money), tags(:food)]
    
    assert org.has_tag?(tags(:money)), 'has tag money'
    assert org.has_tag?(tags(:food)), 'has tag money'
    assert !org.has_tag?(tags(:cloth)), 'don\'t has tag cloth'
  end

  test "should validate email only with format like abc@de.fg" do
    invalid_org = organizations(:wwf)
    invalid_org.email = "invalidmail"
    valid_org = organizations(:redcross)
    valid_org.email = "valid.string+alias@mail.com"
 
    assert !invalid_org.valid?
    assert valid_org.valid?
  end

  test "bugfix: should create organization with only one char before 'a'" do
     
    valid_org = organizations(:wwf)
    valid_org.email = "a@a.a"

    assert valid_org.valid?
  end

  
end
