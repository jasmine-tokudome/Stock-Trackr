require 'net/http'
require 'uri'
require 'json'

class ProductsController < ApplicationController

  def edit
    @product_id = Product.get_product_ids
    @product_shipments = Product.get_shipment
    @deliveries = Product.get_deliveries
  end

  def update_product_shipments
  product_shipments_params = params.require(:product_shipments).permit!
  # product_shipments_paramsを使って、更新処理を実行する
  end

end