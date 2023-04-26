require 'net/http'
require 'uri'
require 'json'

class Product < ApplicationRecord

  def self.get_api_data
    url = 'https://api.shop-pro.jp/v1/shop.json'
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer ENV[colorme_access_token]"
    request['Content-Type'] = 'application/json'
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
    data = JSON.parse(response.body)
    # 取得したデータをハッシュに変換して返す
    data.to_h
  end

  def self.set_product_data
    @product = self.get_api_data
  end
end


