require 'spec_helper'

describe OrganizationsController do

  it 'should have an index page' do
    get :index
    response.should be_success
    response.should render_template :index
    request.flash.should be_empty
  end

  it 'should have a new page' do
    get :new
    response.should be_success
  end

  it 'should create an organization' do
    expect {post :create, :organization => Factory.attributes_for(:organization)}.to change(Organization, :count).by(1)
    response.should redirect_to(Organization.last)
  end
  context 'when manipulating organizations' do
    let(:organization) {Factory :organization}

    it 'should show an organization' do
      get :show, :id => organization
      response.should be_success
    end

    it 'should be able to edit an organization' do
      get :edit, :id => organization
      response.should be_success
    end

    it 'should be able to successfully update an organization' do
      put :update, :id => organization, :organization => {:name => "EvilOrganization"}
      response.should be_redirect
    end

    it 'should be able to successfully delete an organization' do
      delete :destroy, :id => organization
      response.should redirect_to(organizations_path)
    end

    it 'should show tags when there is a validation error while creating an organization' do
      put :create, :organization => {}
      response.should be_success
    end
  end

  context 'when searching for organizations' do
    let(:organization) {Factory :organization}

    it 'should return organizations based on its name' do
      get :search, :q => organization.name
      assigns(:organizations).should include(organization)
    end

    it 'should return organizations based on its city' do
      get :search, :q => organization.city
      assigns(:organizations).should include(organization)
    end

    it 'should return organizations based on tags' do
      tag = Factory :tag
      organization.tags << tag
      get :search, :tag_ids => [tag]
      assigns(:organizations).should include(organization)
    end

    it 'should not return an organization without the tag being searched' do
      tag = Factory :tag
      get :search, :tag_ids => [tag]
      assigns(:organizations).should_not include(organization)
    end

    it 'should be able to find organizations based on cities with/without accents' do
      organization.city = 'São Paulo'
      organization.save!
      get :search, :q => 'sao paulo'
      assigns(:organizations).should include(organization)
      get :search, :q => 'são paulo'
      assigns(:organizations).should include(organization)
    end

    it 'should not allow SQL injections' do
      get :search, :q => "' or '1=1"
      assigns(:organizations).should be_empty
    end
  end
end

