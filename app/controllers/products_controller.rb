require 'net/http'
require 'uri'
require 'json'

class ProductsController < ApplicationController

  def edit
    @product = Product.set_product_data
  end

end
