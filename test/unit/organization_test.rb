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
end
