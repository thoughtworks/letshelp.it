class HomeController < ApplicationController

  def index
  	@organizations = Organization.all
  	@tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organizations }
    end
  end

end
