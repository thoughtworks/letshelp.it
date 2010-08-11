module OrganizationsHelper

	def has_tag?(tag)
		not @organization.nil? and @organization.tags.include?(tag)
	end

end
