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
  products_stocks_params = params.require(:products_stocks).permit!
  # 外部APIにPUTリクエストを送信するロジックを実装する
  products_stock_details = params[:products_stocks][:products_stock_details]
  products_stock_details.each do |id, details|
    # PUTリクエストを送信するコードを記述する
    url = "https://api.shop-pro.jp/v1/products/#{id}"
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = true
    # http.ssl_version = :TLSv1_3 # TLSv1.3を指定
    request = Net::HTTP::Put.new(uri)
    request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
    csrf_token = form_authenticity_token
    request['X-CSRF-Token'] = csrf_token
    request['Content-Type'] = 'application/json'
    request['scopes'] = 'write_products'
    request.body = { id: "id", stocks: "stocks" }.to_json
    response = http.request(request)
    if response.present? && response.code.to_i == 200
    redirect_to "/products/edit", notice: '更新が完了しました'
    else
    redirect_to "/products/edit", flash: { alert: '更新に失敗しました。再度修正してください' }
    end
  end
end

# @products_stocks
# {174335511=>{"id"=>174335511, "name"=>"商品D", "stock_managed"=>false, "stocks"=>nil}, 174335508=>{"id"=>174335508, "name"=>"商品C", "stock_managed"=>false, "stocks"=>nil}, 174335506=>{"id"=>174335506, "name"=>"商品B", "stock_managed"=>true, "stocks"=>0}, 174335504=>{"id"=>174335504, "name"=>"商品A", "stock_managed"=>true, "stocks"=>100}}


end