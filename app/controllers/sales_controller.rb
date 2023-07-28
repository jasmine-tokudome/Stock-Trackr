require 'net/http'
require 'uri'
require 'faraday'
require 'json'

class SalesController < ApplicationController
  def new
    @sales_ids = Sale.get_sales_ids
  end
end
