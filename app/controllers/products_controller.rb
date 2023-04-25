require 'net/http'
require 'json'

class ProductsController < ApplicationController
  before_action :set_oauth2_client

  def edit
    uri = URI('https://api.shop-pro.jp/v1/shop.json')
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    @products = Product.all
    end
    # if response.code == '200'
    #   json = JSON.parse(response.body)
    #   # 取得したJSONデータを処理する
    # else
    #   response.code == '404100'
    #   # エラー処理
    # end
  end

  private

  def set_oauth2_client
    client_id = ENV['colorme_client_id']
    client_secret = ENV['colorme_client_secret']
    # flow_type = ENV['colorme_code']
    # authorize_url = https://api.shop-pro.jp/oauth/authorize
    # token_url =  https://api.shop-pro.jp/oauth/token
    # required_scopes = read_products
    @client = OAuth2::Client.new(client_id, client_secret)
  end
end
