require File.expand_path(File.dirname(__FILE__) + "/../test_helper")

class TagTest < ActiveSupport::TestCase

  should validate_presence_of :name

  should validate_uniqueness_of :name

end

