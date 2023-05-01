require 'net/http'
require 'uri'
require 'json'

class ProductsController < ApplicationController

  def edit
    # @product_count = Product.count_products
    @products_shipment = Product.get_product_id
  end

end
