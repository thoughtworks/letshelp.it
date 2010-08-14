require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  
  test "should not include two Organization with the same name" do
    rc = Organization.new do |o|
      o.name = 'Red Cross'
      o.responsible = 'Linda Taylor'
      o.city = 'London'
      o.country = 'UK'
    end
    
    assert !rc.save, 'should not save duplicated red cross'
  end
  
  test "should return if the given tag is associated to the organization" do
    
    org = organizations(:wwf)
    org.tags = [tags(:money), tags(:food)]
    
    assert org.has_tag?(tags(:money)), 'has tag money'
    assert org.has_tag?(tags(:food)), 'has tag money'
    assert !org.has_tag?(tags(:cloth)), 'don\'t has tag cloth'
  end
  
end
