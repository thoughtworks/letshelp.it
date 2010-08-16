require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase

  context 'index page' do
    setup { get :index }
    should respond_with :success
    should assign_to :organizations
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post :create, :organization => { :name => "title", :responsible => "responsible", :city => "city", :country => "country"}
    end
    assert_redirected_to organization_path(assigns(:organization))
  end

  test "should show organization" do
    get :show, :id => organizations(:wwf).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => organizations(:redcross).to_param
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

  test "should be able to create a new tag on organization creation" do
    get :new
    assert assigns :tag
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
