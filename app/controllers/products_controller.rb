require 'net/http'
require 'uri'
require 'json'

class ProductsController < ApplicationController

  def edit
    @product_id = Product.get_product_ids
    @product_shipments = Product.get_shipment
    @deliveries = Product.get_deliveries
  end
  
end

# @product_shipments の中身
# {174335511=>{"id"=>174335511, "name"=>"商品D", "unavailable_delivery_ids"=>[588090, 588091]}, 174335508=>{"id"=>174335508, "name"=>"商品C", "unavailable_delivery_ids"=>[588091]}, 174335506=>{"id"=>174335506, "name"=>"商品B", "unavailable_delivery_ids"=>[588090]}, 174335504=>{"id"=>174335504, "name"=>"商品A", "unavailable_delivery_ids"=>[588089]}}
