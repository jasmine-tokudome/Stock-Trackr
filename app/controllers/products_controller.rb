require 'net/http'
require 'uri'
require 'json'

class ProductsController < ApplicationController

  def edit
    @product_count = Product.count_products
    @products = Product.get_api_data
  end

end
