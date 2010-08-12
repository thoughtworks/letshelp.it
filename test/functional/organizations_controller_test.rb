require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
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
    get :show, :id => organizations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => organizations(:one).to_param
    assert_response :success
  end

  test "should update organization" do
    put :update, :id => organizations(:one).to_param, :organization => {:name => "updated title" }
    assert_redirected_to organization_path(assigns(:organization))
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete :destroy, :id => organizations(:one).to_param
    end
    assert_redirected_to organizations_path
  end

  test "should show tags when there is a validation error while creating a organization" do
    put :create, :organization => {}
    assert_response :success 
  end
end
