class HomeController < ApplicationController

  def index
  	@organizations = Organization.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organizations }
    end
  end
  
  def about
    respond_to do |format|
      format.html {
        if I18n.locale.to_s =~ /en/ then 
          render 'about_en.erb'
        else
          render 'about_pt.erb'
        end
      }
    end
  end

end
