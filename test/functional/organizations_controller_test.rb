# coding: UTF-8

require File.expand_path(File.dirname(__FILE__) + "/../test_helper")

class OrganizationsControllerTest < ActionController::TestCase

  context 'index page' do
    setup { get :index }
    should respond_with :success
    should assign_to :organizations
    should render_template :index
    should_not set_the_flash
  end

  should "get new" do
    get :new
    assert_response :success
  end

  should "create organization" do
    assert_difference('Organization.count') do
      post :create, :organization => { :name => "title", :contact => "contact", :city => "Jaragua do Sul", :password => "password", :email => "email@mail.com", :country => "country", :announcer => "announcer"}
    end
    assert_redirected_to organization_path(assigns(:organization))
  end

  should "show organization" do
    get :show, :id => organizations(:redcross).to_param
    assert_response :success
  end

  should "get edit" do
    get :edit, :id => organizations(:wwf).to_param
    assert_response :success
  end

  should "update organization" do
    put :update, :id => organizations(:wwf).to_param, :organization => {:name => "updated title"}
    assert_redirected_to organization_path(assigns(:organization))
  end

  should "destroy organization" do
    assert_difference('Organization.count', -1) do
      delete :destroy, :id => organizations(:wwf).to_param
    end
    assert_redirected_to organizations_path
  end

  should "show tags when there is a validation error while creating a organization" do
    put :create, :organization => {}
    assert_response :success 
  end


  context "organizations search" do

    should "reply the organizations related to a name in the search term" do
      get :search, :q => 'Red Cross'
      assert_search_successful [organizations(:redcross)], assigns(:organizations)
    
      get :search, :q => 'santa Casa de misericordia'
      assert_search_successful [organizations(:santa_casa)], assigns(:organizations)
    
      get :search, :q => 'misericórdia'
      assert_search_successful [organizations(:santa_casa)], assigns(:organizations)
    end
  
    should "reply the organizations related to a city in the search term" do
      get :search, :q => 'tangamandapio'
    
      assert_search_successful [organizations(:wwf)], assigns(:organizations)
    end

    should "not reply the organizations related to a tag name in the search term" do
      get :search, :q => 'food'
      assert_search_successful [], assigns(:organizations)
    end
  
    should "reply search filtered by the selected tags" do
      get :search, :q => 'r', :tag_ids => [tags(:cloth).id.to_s]
      assert_search_successful [organizations(:wwf)], assigns(:organizations)
    end
  
    should "return all organizations with the given tags" do
      get :search, :tag_ids => [tags(:food).id.to_s]
      assert_search_successful [organizations(:redcross), organizations(:wwf), organizations(:xpto)], assigns(:organizations)
    
      get :search, :tag_ids => [tags(:cloth).id.to_s, tags(:money).id.to_s]
      assert_search_successful [organizations(:wwf), organizations(:xpto), organizations(:redcross)], assigns(:organizations)
    end
  
    should "be able to find cities with and without accent" do
      get :search, :q => 'são paulo'
      assert_search_successful [organizations(:greenpeace), organizations(:santa_casa)], assigns(:organizations)
    
      get :search, :q => 'sao paulo'
      assert_search_successful [organizations(:greenpeace), organizations(:santa_casa)], assigns(:organizations)
    end
  
    should "not allow SQL injection" do
      get :search, :q => "' or '1=1"
      assert_search_successful [], assigns(:organizations)
      
      get :search, :q => "%%"
      assert_search_successful Organization.all, assigns(:organizations)
      
      get :search, :q => "%sao paulo%"
      assert_search_successful [organizations(:greenpeace), organizations(:santa_casa)], assigns(:organizations)

      assert_no_difference "Organization.count" do
        get :search, :q => "%'); DELETE FROM ""organizations""; SELECT * FROM ""organizations"" WHERE name LIKE '%"
      end
    end
  
  end

  should "be able to edit organization when match password" do
    get :ajax_edit, :id => organizations(:wwf).id, :password => organizations(:wwf).password
    assert_response :success
  end
  
  should "not be able to edit organization when password dont match" do
    get :ajax_edit, :id => organizations(:wwf).id, :password => "wrong_pass"
    assert :status => :failure
  end
  
  private

  def assert_search_successful(expected_results, received_results)
    assert_response :success
    assert_same_elements expected_results, received_results, "Expected [#{expected_results.inject([]) {|a,o| a << o.name}.join(', ')}], but got [#{received_results.inject([]) {|a,o| a << o.name}.join(', ')}]."
  end

end
