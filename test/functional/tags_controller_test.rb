require 'test_helper'

class TagsControllerTest < ActionController::TestCase
=begin
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
      post :create, :tag => { :name => "tag" }
    end

    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should show tag" do
    get :show, :id => tags(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tags(:one).to_param
    assert_response :success
  end

  test "should update tag" do
    put :update, :id => tags(:one).to_param, :tag => { :name => "updated_name" }
    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete :destroy, :id => tags(:one).to_param
    end

    assert_redirected_to tags_path
  end

  test "should create a tag with ajax request" do
    assert_difference('Tag.count', 1) do
      get :ajax_tag, :name => 'new tag'
    end
  end

  test "should not create a invalid tag with ajax request" do
    get :ajax_tag, :name => ""
    assert_response :unprocessable_entity
  end 
=end

  test "should fail" do
    assert false
  end

end
