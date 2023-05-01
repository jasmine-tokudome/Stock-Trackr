require 'net/http'
require 'uri'
require 'json'

class ProductsController < ApplicationController

  def edit
    @product_id = Product.get_product_ids
    @products_shipment = Product.get_shipment

  end

end
