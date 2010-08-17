require File.expand_path(File.dirname(__FILE__) + "/../test_helper")

class OrganizationsControllerTest < ActionController::TestCase

  context 'index page' do
    setup { get :index }
    should respond_with :success
    should assign_to :organizations
    should render_template :index
    should_not set_the_flash
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post :create, :organization => { :name => "title", :contact => "contact", :city => "city", :password => "password", :email => "email@mail.com" , :country => "country", :announcer => "announcer" }
    end
    assert_redirected_to organization_path(assigns(:organization))
  end

  test "should show organization" do
    get :show, :id => organizations(:redcross).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => organizations(:wwf).to_param
    assert_response :success
  end

  test "should update organization" do
    put :update, :id => organizations(:wwf).to_param, :organization => {:name => "updated title" }
    assert_redirected_to organization_path(assigns(:organization))
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete :destroy, :id => organizations(:wwf).to_param
    end
    assert_redirected_to organizations_path
  end

  test "should show tags when there is a validation error while creating a organization" do
    put :create, :organization => {}
    assert_response :success 
  end

  test "should reply the organizations related to a name in the search term" do
    get :search, :q => 'Red Cross'
    
    assert_search_successful [organizations(:redcross)], assigns(:organizations)
  end
  
  test "should reply the organizations related to a city in the search term" do
    get :search, :q => 'tangamandapio'
    
    assert_search_successful [organizations(:wwf)], assigns(:organizations)
  end

  test "should reply the organizations related to a tag name in the search term" do
    get :search, :q => 'food'
    
    assert_search_successful [organizations(:wwf), organizations(:redcross)], assigns(:organizations)
  end

  test "should be able to edit organization when match password" do
    get :ajax_edit, :id => organizations(:wwf).id, :password => organizations(:wwf).password
    assert_response :success
  end
  
  test "should not be able to edit organization when password dont match" do
    get :ajax_edit, :id => organizations(:wwf).id, :password => "wrong_pass"
    assert :status => :failure
  end
  private
 

  def assert_search_successful(expected_results, received_results, message='')
    assert_response :success, message
    assert received_results, message
    assert_equal expected_results.size, received_results.size
    expected_results.each do |r|
      assert received_results.include?(r), message
    end
  end

end
