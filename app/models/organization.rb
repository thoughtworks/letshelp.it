class Organization < ActiveRecord::Base

	validates_presence_of :name, :contact, :city, :country

	validates_uniqueness_of :name

	has_and_belongs_to_many :tags
	
	def has_tag?(tag)
		not @tags.nil? and @tags.include?(tag)
	end

end
