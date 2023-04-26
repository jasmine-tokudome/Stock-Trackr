require 'net/http'
require 'json'

class ProductApi
before_action: set_oauth2_client

 def fetch_products
    url = 'https://api.shop-pro.jp/v1/products/{product_id}.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    data['products'].each do |product_data|
      product = Product.from_json(product_data)
      product.save
    end
  end
end

  privacy

  def set_oauth2_client
  require 'oauth2'
  CLIENT_ID = ENV['colorme_client_id']
  CLIENT_SECRET = ENV['colorme_client_secret']
  API_ENDPOINT = 'https://api.shop-pro.jp'
  AUTHORIZATION_URL = 'https://api.shop-pro.jp/oauth/authorize'
  TOKEN_URL = 'https://api.shop-pro.jp/oauth/token'
  end

end
