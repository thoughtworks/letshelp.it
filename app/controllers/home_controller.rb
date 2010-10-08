class HomeController < ApplicationController

  def index
    @organizations = Organization.get_random_list(6)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def about
    respond_to do |format|
      format.html { render "about_#{I18n.locale.to_s.downcase}.erb" }
    end
  end

end
