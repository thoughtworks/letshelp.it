require File.expand_path(File.dirname(__FILE__) + "/../test_helper")

class HomeControllerTest < ActionController::TestCase

  context "index page" do
    setup { get :index }
    should respond_with :success
    should assign_to :organizations
    should assign_to :tags
  end

  context "about page" do

    context "in portuguese" do
      setup do
        get :about, :locale => 'pt'
      end
      
      should respond_with :success
      should assign_to :tags
      should render_template 'home/about_pt.erb'
    end

    context "in english" do
      setup do
        get :about, :locale => 'en'
      end
      
      should respond_with :success
      should assign_to :tags
      should render_template 'home/about_en.erb'
    end

    context "in any other language" do
      setup do
        get :about, :locale => 'foo'
      end
      
      should respond_with :success
      should assign_to :tags
      should render_template 'home/about_pt.erb'
    end
    
  end
  
end
