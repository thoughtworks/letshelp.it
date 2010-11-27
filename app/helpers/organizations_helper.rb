module OrganizationsHelper
  require 'uri'

  def compose_twitter_share_url()
     URI.escape('http://twitter.com/share?url=http://letshelp.it/' +
        @organization.name_slug +
        '&amp;text=' +
        t("twitter_share.please_help") +
        @organization.name +
        '&amp;via=LetsHelpIt')
  end

end

