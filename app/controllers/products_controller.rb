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
  product_shipment_details = params[:product_shipments][:product_shipment_details]
  product_shipment_details.each do |id, details|
    unavailable_delivery_ids = details[:unavailable_delivery_ids]
    # PUTリクエストを送信するコードを記述する
    url = "http://example.com/api/product_shipments/#{id}.json"
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
    request.body = { id: "id",  unavailable_delivery_ids: "unavailable_delivery_ids" }.to_json
    response = http.request(request)
  end

  if response.present? && response.code.to_i == 200
    redirect_to "/products/edit", notice: '更新が完了しました'

  else
    redirect_to "/products/edit", flash: { alert: '更新に失敗しました。再度修正してください' }
  end

end

  
end