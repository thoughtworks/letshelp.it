# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "main"
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_locale
  before_filter :find_all_tags

  private
    def find_all_tags
    	@tags = Tag.all
    end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  protected 
  def set_locale
    # update session if passed
    session[:locale] = params[:locale] if params[:locale]

    # set locale based on session or default
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
