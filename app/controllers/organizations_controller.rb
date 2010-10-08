class OrganizationsController < ApplicationController

  before_filter :find_organization, :only => [:show, :edit, :update, :destroy]
  
private
  def find_organization
  	@organization = Organization.find(params[:id])
  end
  
public
  # GET /organizations
  # GET /organizations.xml
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.xml
  def show
    @organization = Organization.find(params[:id])
    @tags = Tag.all
  end

  # GET /organizations/new
  # GET /organizations/new.xml
  def new
    @organization = Organization.new
    @tag = Tag.new
  end

  # GET /organizations/1/edit
  def edit
  end

  def ajax_edit
    @organization = Organization.find(params[:id])
    respond_to do |format|
      if(@organization.password == params[:password]) then
        format.js { render :partial => "organizations/form" , :locals => { :action => "Update" } }
      else
        format.js { render :text => t("wrong_password"), :status => :forbidden }
      end
    end
  end

  # POST /organizations
  # POST /organizations.xml
  def create
    params[:organization][:tag_ids] ||= []
    @organization = Organization.new(params[:organization])

    respond_to do |format|
      if @organization.save
        flash[:notice] = '<h4 class="successfulAdded">' + t("organization.success_created") + '</h4>'
        format.html { redirect_to(@organization) }
      else
        @tag = Tag.new
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.xml
  def update
    params[:organization][:tag_ids] ||= []

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        flash[:notice] = '<h4 class="successfulUpdated">' + t("organization.success_updated") + '</h4>'
        format.html { redirect_to(@organization) }
      else
        format.html { render :layout => "main", :partial => "form", :locals => { :action => "Update" } } 
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.xml
  def destroy
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to(organizations_url) }
    end
  end
  
  def search
    tag_ids = params[:tag_ids]
    name_slug = "%#{Organization.slug_name(params[:q])}%"
    city_slug = "%#{Organization.slug_city(params[:q])}%"
    @organizations = Organization.find(:all, :conditions => ["name_slug like ? OR city_slug like ?", name_slug , city_slug ] )
    @organizations &= Tag.find(tag_ids).inject([]) { |a,t| a + t.organizations } if tag_ids && !tag_ids.empty?
    
    respond_to do |format|
      format.html { render :action => :index }
    end
  end

end
