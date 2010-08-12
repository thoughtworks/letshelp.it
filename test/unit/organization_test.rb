require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "should not save Organization without name, city, country" do
    org = Organization.new
    assert !org.save

    org.name = 'Red Cross'
    assert !org.save, 'Should not insert with just name'

    org.city = 'Orlando'
    assert !org.save, 'Should not insert with just name and city'

    org.responsible = 'Rubens Barrichelo'
    assert !org.save, 'Should not insert with just name, city and responsible'

    org.country = 'United States of America' 
    assert org.save, 'Should save organization'
 
  end

end
