require 'net/http'
require 'uri'
require 'json'

class ProductsController < ApplicationController

  def edit
    Product.set_product_data
    @product = Product.new
  end

end
