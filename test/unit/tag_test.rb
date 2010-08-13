require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should not create two tags with the same name" do
    tag = Tag.new(:name => "Dilma Caveira")
    assert tag.save
    tag = Tag.new(:name => "Dilma Caveira")
    assert (not tag.save)
  end

end

