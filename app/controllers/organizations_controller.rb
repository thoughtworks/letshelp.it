class OrganizationsController < ApplicationController

  before_filter :find_organization, :only => [:show, :edit, :update, :destroy]
  before_filter :find_all_tags, :only => [:new, :show, :create, :edit, :update]
  
private
  def find_organization
  	@organization = Organization.find(params[:id])
  end
  
  def find_all_tags
  	@tags = Tag.all
  end
  
public
  # GET /organizations
  # GET /organizations.xml
  def index
    @organizations = Organization.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.xml
  def show
    @organization = Organization.find(params[:id])
    @tags = Tag.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @organization }
    end
  end

  # GET /organizations/new
  # GET /organizations/new.xml
  def new
    @organization = Organization.new
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    #@organization = Organization.find(params[:id])
    @tag = Tag.new
  end

  # POST /organizations
  # POST /organizations.xml
  def create
    @organization = Organization.new(params[:organization])
    params[:organization][:tag_ids] ||= []

    respond_to do |format|
      if @organization.save
        flash[:notice] = 'Organization was successfully created.'
        format.html { redirect_to(@organization) }
        format.xml  { render :xml => @organization, :status => :created, :location => @organization }
      else
        @tag = Tag.new
        format.html { render :action => "new" }
        format.xml  { render :xml => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.xml
  def update
    #@organization = Organization.find(params[:id])
    params[:organization][:tag_ids] ||= []

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        flash[:notice] = 'Organization was successfully updated.'
        format.html { redirect_to(@organization) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.xml
  def destroy
    #@organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to(organizations_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
     @organizations = Organization.find(:all, :conditions => "name like '%#{params[:q]}%' OR city like '%#{params[:q]}%'")
     tag = Tag.find(:all, :conditions => "name like '%#{params[:q]}%'")[0]
     @organizations = (@organizations + tag.organizations).uniq if not tag.nil?   
    
    respond_to do |format|
      format.html { render :action => :index }
      format.xml  { render :xml => @organizations }
    end
  end

end
