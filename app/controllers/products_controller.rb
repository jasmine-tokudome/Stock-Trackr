require 'net/http'
require 'uri'
require 'faraday'
require 'json'

class ProductsController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def edit
    @product_id = Product.get_product_ids
    @product_shipments = Product.get_shipment
    @deliveries = Product.get_deliveries
    @products_stocks = Product.get_stock
  end

  def update_stocks
  # products_stocks_paramsを使って、更新処理を実行する
  products_stocks_params = params.require(:product).permit(stocks: {}).to_h.symbolize_keys
  # 外部APIにPUTリクエストを送信するロジックを実装する
  products_stock_details = products_stocks_params[:stocks]
  products_stock_details.each do |id,stock|
    # PUTリクエストを送信するコードを記述する
    url = "https://api.shop-pro.jp/v1/products/#{id}.json"
    conn = Faraday.new(url: url) do |faraday|
      faraday.headers = {
        'Authorization' => "Bearer #{ENV['colorme_access_token']}",
        'X-CSRF-Token' => form_authenticity_token,
        'Content-Type' => 'application/json',
        'scopes' => 'write_products'
      }
      faraday.adapter Faraday.default_adapter
    end
    response = conn.put do |req|
      req.body = { stocks: stock }.to_json
    end
    if response.present? && response.status == 200
      next
    else
      render status: :bad_request, json: { message: '更新に失敗しました。再度修正してください' }
      return
    end
  end
  head :no_content
end
end