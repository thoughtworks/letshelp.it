module OrganizationsHelper
  require 'uri'

	def has_tag?(tag)
		not @organization.nil? and @organization.tags.include?(tag)
	end

  def compose_twitter_share_url()
     URI.escape('http://twitter.com/share?url=http://letshelp.it' +
        url_for(@organization) +
        '&amp;text=' +
        t("twitter_share.please_help") +
        @organization.name +
        '&amp;via=LetsHelpIt')
  end

end
