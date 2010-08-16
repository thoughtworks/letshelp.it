require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  
  should validate_presence_of :name  
  should validate_presence_of :contact
  should validate_presence_of :country

  should validate_uniqueness_of :name
 
  test "should return if the given tag is associated to the organization" do
    
    org = organizations(:wwf)
    org.tags = [tags(:money), tags(:food)]
    
    assert org.has_tag?(tags(:money)), 'has tag money'
    assert org.has_tag?(tags(:food)), 'has tag money'
    assert !org.has_tag?(tags(:cloth)), 'don\'t has tag cloth'
  end
  
end
