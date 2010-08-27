# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "main"
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_locale
  before_filter :find_all_tags

  protected
    def find_all_tags
    	@tags = Tag.all
    end

    def set_locale
      locale_verifier = LocaleVerifier.new(I18n.available_locales)

      if self.action_name == 'index' && params[:locale]
        session[:locale] = locale_verifier.find_compatible_locale(params[:locale]) 
      end

      if !session[:locale]
        http_accept_language = locale_verifier.parse_accept_language_string(request.env['HTTP_ACCEPT_LANGUAGE'])
        request_language = locale_verifier.find_compatible_locale(http_accept_language)
        session[:locale] = request_language || I18n.default_locale
      end

      I18n.locale = session[:locale]
    end
end
