class HomeController < ShopifyApp::AuthenticatedController
  def index
    @customers = ShopifyAPI::Customer.find(:all, :params => {:limit => 10})
  end
end
