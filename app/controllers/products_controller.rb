require 'net/http'
require 'uri'
require 'json'

class ProductsController < ApplicationController

  def edit
    @product_id = Product.get_product_ids
    product_shipments = Product.get_shipment
    products = []
    product_shipments.each do |product|
    @products << product
    return if product_shipments?
  end

  end

end
