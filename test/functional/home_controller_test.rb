require File.expand_path(File.dirname(__FILE__) + "/../test_helper")

class HomeControllerTest < ActionController::TestCase

  test "should assign organizations and tags" do
    get :index
    assert respond_with :success
    assert assign_to :organizations
    assert assign_to :tags
  end
end
