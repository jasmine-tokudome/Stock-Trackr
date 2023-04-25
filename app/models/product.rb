# class Product
#   include ActiveModel::Model
#   include ActiveModel::Attributes

#   attribute :id, :integer
#   attribute :name, :string
#   # attribute :unavailable_delivery_ids, :Array of integers
#   attribute :error, :string, default: ''

require 'net/http'
require 'json'

class Product < ApplicationRecord
 include HTTParty
  base_uri 'https://api.shop-pro.jp/v1/shop.json'  # APIのエンドポイントを設定

  def self.get_data
    uri = URI('https://api.shop-pro.jp/v1/shop.json')
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
    # response = get(base_uri)  # APIにGETリクエストを送信
    return JSON.parse(response.body)
  end

#   class << self
#     def all
#       ProductApi.search
#     end
#   end

  def has_error?
    status.to_s.match?(/^[45]/)
  end
end


