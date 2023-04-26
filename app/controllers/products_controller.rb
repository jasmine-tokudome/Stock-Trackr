require 'net/http'
require 'json'

class ProductsController < ApplicationController

  def edit
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

end
