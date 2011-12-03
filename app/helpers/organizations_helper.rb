module OrganizationsHelper
  require 'uri'

  def compose_twitter_share_text()
     'http://letshelp.it/' +
        @organization.name_slug +
        ' ' +
        t("twitter_share.please_help") +
        @organization.name
  end


  def compose_facebook_like_url()
     URI.escape('http://letshelp.it/' +
        @organization.name_slug)
  end


end

