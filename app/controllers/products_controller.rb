require 'net/http'
require 'uri'
require 'json'

class ProductsController < ApplicationController

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
  products_stock_details.each do |id,stocks|
    # PUTリクエストを送信するコードを記述する
    url = "https://api.shop-pro.jp/v1/products/#{id}.json"
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Put.new(uri)
    request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
    csrf_token = form_authenticity_token
    request['X-CSRF-Token'] = csrf_token
    request['Content-Type'] = 'application/json'
    request['scopes'] = 'write_products'
    request.body = { id: id, stocks: stocks }.to_json
    response = http.request(request)
    if response.present? && response.code.to_i == 200
      next
    else
      render status: :bad_request, json: { message: '更新に失敗しました。再度修正してください' }
      return
    end
  end
  head :no_content
end
end