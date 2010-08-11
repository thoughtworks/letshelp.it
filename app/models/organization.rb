class Organization < ActiveRecord::Base

	validates_presence_of :name, :responsible, :city, :country
	validates_uniqueness_of :name

	has_many :tags

end
