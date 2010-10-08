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
        session[:locale] = 'pt-br'
        get :about
      end
      
      should respond_with :success
      should assign_to :tags
      should render_template 'home/about_pt-br'
    end

    context "in english" do
      setup do
        session[:locale] = 'en'
        get :about
      end
      
      should respond_with :success
      should assign_to :tags
      should render_template 'home/about_en'
    end

    context "in any other language" do
      setup do
        session[:locale] = 'foo'
        get :about
      end
      
      should respond_with :success
      should assign_to :tags
      should render_template 'home/about_pt-br'
    end
    
  end
  
  context "locale settings" do

    should "have portuguese (Brazil) as default language" do
      get :index
      assert_equal :'pt-BR', I18n.locale
    end

    should "get language from the browser request" do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'de,en-us;p=0.5'
      get :index
      assert_equal :en, I18n.locale
    end

    should "not get language from the browser request if it isn't available in the application" do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'de,it;p=0.5' 
      get :index
      assert_equal I18n.default_locale, I18n.locale
    end

    should "get locale from session" do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'de,pt-br;p=0.5'  
      session[:locale] = 'en'
      get :index
      assert_equal session[:locale].to_sym, I18n.locale
    end

    should "get locale from params" do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'de,pt-br;p=0.5'
      locale = 'en'
      get :index, :locale => locale
      assert_equal locale.to_sym, I18n.locale
    end

    should "get locale from params if both params and session are set" do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'de,pt-br;p=0.5'
      session[:locale] = 'pt-br'
      locale = 'en'
      get :index, :locale => locale
      assert_equal locale.to_sym, I18n.locale
    end

    should "use default locale if locale stored in session is invalid" do
      session[:locale] = 'foo'
      get :index
      assert_equal I18n.default_locale, I18n.locale
    end
  end
end
