class HomeController < ShopifyApp::AuthenticatedController
  skip_around_action :shopify_session
  def index
    @customers = ShopifyAPI::Customer.find(:all, :params => {:limit => 100})
  end
end
