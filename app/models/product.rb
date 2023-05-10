require 'net/http'
require 'uri'
require 'json'

class Product

  def self.get_product_ids
    # 登録されている商品の商品IDを取り出す
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
    @product_ids = products.map { |product| product["id"] }.flatten
  end

  def self.get_shipment
   # 商品IDの配列
   product_ids = @product_ids 
   # product_idsがnilである場合、処理を終了する
   return if product_ids.nil?
   #  商品情報のうち必要な3項目のみを取り出す（商品ID、商品名、利用不可配送方法ID）
   products = {}
   product_ids.each do |product_id|
    url = "https://api.shop-pro.jp/v1/products/#{product_id}.json?fields=id,name,unavailable_delivery_ids"
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
    request['Content-Type'] = 'application/json'
    request['scopes'] = 'read_products'
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
    json_data = JSON.parse(response.body)
    product = json_data["product"]
    products[product_id] = product
    end
    return products
  end

  def self.get_deliveries
   # 商品情報に含まれる利用不可配送方法IDを配送名に置き換えるための準備
   url = 'https://api.shop-pro.jp/v1/deliveries.json?fields=id,name'
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
    request['Content-Type'] = 'application/json'
    request['scopes'] = 'read_products'
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
    json_data = JSON.parse(response.body)
    deliveries = json_data["deliveries"]
    return deliveries
  end

end
