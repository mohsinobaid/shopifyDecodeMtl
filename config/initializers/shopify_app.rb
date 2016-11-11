ShopifyApp.configure do |config|
  config.api_key = "0bcdcf6dae744fbd50e213a01fdbc456"
  config.secret = "81012edc7ff6276a57263af5b1d4aef9"
  config.scope = "read_orders, read_products, read_customers"
  config.embedded_app = true
end

if ENV['API_KEY'] && ENV['API_PASS']
  shop_url = "https://#{ENV['API_KEY']}:#{ENV['API_PASS']}@decodemtla.myshopify.com/admin"
  ShopifyAPI::Base.site = shop_url
end
