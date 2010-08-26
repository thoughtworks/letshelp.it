require File.expand_path(File.dirname(__FILE__) + "/../test_helper")

class HomeControllerTest < ActionController::TestCase

  context "index page" do
    setup { get :index }
    should respond_with :success
    should assign_to :organizations
    should assign_to :tags
  end
end
