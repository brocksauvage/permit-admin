module AlertsHelper
  def check_link_url(link)
    link.include?('www.') && !link.include?('http') ? URI::HTTP.build({ host: link }).to_s : link
  end
end
