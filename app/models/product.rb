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
    request['scopes'] = 'read_products','write_products'
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
    date = JSON.parse(response)
    # 取得したデータの数を返す
    product_count = date.length
    return product_count
  end

  def self.get_api_data
    url = 'https://api.shop-pro.jp/v1/products.json'
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
    request['Content-Type'] = 'application/json'
    request['scopes'] = 'read_products','write_products'
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
    product_index_data = JSON.parse(response.body)
    # 取得したデータをハッシュに変換して返す
    product_index_data.to_h
  end

end
