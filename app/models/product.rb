require 'net/http'
require 'uri'
require 'json'


class Product

   def self.count_products
    url = 'https://api.shop-pro.jp/v1/products.json?fields=ids'
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
    request['Content-Type'] = 'application/json'
    request['scopes'] = 'read_products'
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
    id_array = JSON.parse(response.body)
    # 配列productsの値の数を抽出
    product_count = id_array["products"].length
    return product_count
  end

  def self.get_product_id
    url = 'https://api.shop-pro.jp/v1/products.json'
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
    request['Content-Type'] = 'application/json'
    request['scopes'] = 'read_products','write_products'
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
    json_data = JSON.parse(response.body)
    products = json_data["products"]
    # 商品IDの取り出し
    product_ids = products.map { |product| product["id"] }.flatten    
  end


end
