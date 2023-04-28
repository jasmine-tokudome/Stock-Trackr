require 'net/http'
require 'uri'
require 'json'

class ProductsController < ApplicationController

  def edit
    @products = Product.get_api_data
  end

end
