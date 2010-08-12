require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "should not save Organization without name, city, country" do
    org = Organization.new
    assert !org.save

    org.name = 'Green Planet'
    assert !org.save, 'Should not insert with just name'

    org.city = 'Orlando'
    assert !org.save, 'Should not insert with just name and city'

    org.responsible = 'Rubens Barrichelo'
    assert !org.save, 'Should not insert with just name, city and responsible'

    org.country = 'United States of America' 
    assert org.save, 'Should save organization'
 
  end
  
  test "should not include two Organization with the same name" do
    rc = Organization.new do |o|
      o.name = 'Red Cross'
      o.responsible = 'Linda Taylor'
      o.city = 'London'
      o.country = 'UK'
    end
    
    assert !rc.save, 'should not save duplicated red cross'
  end 

  test 'should' do
    assert_equal organizations(:redcross).name, 'Red Cross', 'Should have Red Cross as name'
  end
end
