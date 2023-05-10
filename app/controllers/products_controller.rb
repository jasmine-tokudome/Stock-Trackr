require 'net/http'
require 'uri'
require 'json'

class ProductsController < ApplicationController

  def edit
    @product_id = Product.get_product_ids
    @product_shipments = Product.get_shipment
    @deliveries = Product.get_deliveries
  end

  def update
  # product_shipments_paramsを使って、更新処理を実行する
  product_shipments_params = params.require(:product_shipments).permit!
  # 外部APIにPUTリクエストを送信するロジックを実装する
  product_shipment_details = params[:product_shipment][:product_shipment_details]
  product_shipment_details.each do |id, details|
  product_shipment = ProductShipment.find(id)
   product_shipment.unavailable_delivery_ids = details[:unavailable_delivery_ids]
   product_shipment.save
   # PUTリクエストを送信するコードを記述する
   url = "http://example.com/api/product_shipments/#{product_shipment[id]}"
   uri = URI(url)
   http = Net::HTTP.new(uri.host, uri.port)
   http.use_ssl = true
   request = Net::HTTP::Put.new(uri)
   request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
   request['Content-Type'] = 'application/json'
   request['scopes'] = 'write_products'
   request.body = {name: "product_shipment"}.to_json
   response = http.request(request)
   end
  end
  
end