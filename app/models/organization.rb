class Organization < ActiveRecord::Base

  extend Random
  
  has_friendly_id :name, :use_slug => true, :cache_column => 'name_slug', :approximate_ascii => true

	validates_presence_of :name, :contact, :city, :country, :password,  :announcer, :email
	validates_format_of :email, :with  => /[\w+-][\w.+-]*@\w+\.\w+/, :message =>  I18n.t("activerecord.errors.messages.invalid"), :allow_blank => true
	validates_uniqueness_of :name

	has_and_belongs_to_many :tags

	def has_tag?(tag)
		not tags.nil? and tags.include?(tag) 
	end

  def city=(name)
    write_attribute(:city, name)
    write_attribute(:city_slug, Organization.slug_city(name)) if name
  end
  
  def self.slug_name(str)
    str.to_s.to_slug.approximate_ascii.normalize.to_s
  end
  
  def self.slug_city(name)
    name.to_s.to_slug.approximate_ascii.to_s.downcase
  end
  
  def self.get_random_list(limit)
    organizations = Organization.all(:select => :id, :order => db_random, :limit => limit)
    organizations.each { |u| u.reload}
  end

end
