require 'spec_helper'

describe HomeController do
  it 'should have an index page' do
    get :index
    response.should be_success
    response.should render_template(:index)
  end

  context 'about page' do
    it 'should show an about page in portuguese by default' do
      get :about
      response.should render_template 'home/about_pt-br'
    end

    it 'should show an about page in english when chosen' do
      session[:locale] = 'en'
      get :about
      response.should render_template 'home/about_en'
    end
  end

  context 'localization settings' do
    it 'should have pt-br as default language' do
      get :index
      I18n.locale.should == :'pt-BR'
    end

    it 'should get language from the browser request' do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'de,en-us;p=0.5'
      get :index
      I18n.locale.should == :en
    end

    it 'should not get language from the browser request if it isnt available in the application' do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'de,it;p=0.5'
      get :index
      I18n.locale.should == I18n.default_locale
    end

    it 'should get the user language from session' do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'de,it;p=0.5'
      session[:locale] = 'en'
      get :index
      I18n.locale.should == :en
    end

    it 'should get the latest language the user has set' do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'de,it;p=0.5'
      session[:locale] = 'en'
      get :index, :locale => 'pt-BR'
      I18n.locale.should == :'pt-BR'

    end
  end
end

