require 'net/http'
require 'uri'
require 'json'

class Sale
  
  def self.get_sales_ids
    # 受注IDを取り出す
    url = 'https://api.shop-pro.jp/v1/sales.json'
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
    request['Content-Type'] = 'application/json'
    request['scopes'] = 'read_sales','read_products'
    request.set_form_data({ "limit" => "100" })  # limitパラメータを追加
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
    json_data = JSON.parse(response.body)
    sales = json_data["sales"]
    @sale_ids = sales.map { |sale| sale["id"] }.flatten
    puts @sale_ids 
  end

  def self.get_sales_date
   # 受注IDの配列
   sale_ids = @sale_ids 
   # sale_idsがnilである場合、処理を終了する
   return if sale_ids.nil?
   #  #  受注情報のうち必要な項目のみを取り出す（売上ID、受注日時、商品の合計金額、入金済みであるか否か、受注内容詳細）
   sales = {}
   sale_ids.each do |sale_id|
    url = "https://api.shop-pro.jp/v1/sales/#{sale_id}.json?fields=id,make_date,paid,product_total_price,details"
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
    request['Content-Type'] = 'application/json'
    request['scopes'] = 'read_products'
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
    json_data = JSON.parse(response.body)
    sale = json_data["sale"]
    sales[sale_id] = sale
    end
    return sales
  end
  
end
