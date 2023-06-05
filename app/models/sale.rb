require 'net/http'
require 'uri'
require 'json'

class Sale
    
      def self.get_sales_date
        #  受注情報のうち必要な3項目のみを取り出す（売上ID、受注日時、商品の合計金額、入金済みであるか否か、受注内容詳細）
         url = "https://api.shop-pro.jp/v1/sales.json?fields=id,make_date,paid,product_total_price,details"
         uri = URI(url)
         request = Net::HTTP::Get.new(uri)
         request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
         request['Content-Type'] = 'application/json'
         request['scopes'] = 'read_products'
         response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
           http.request(request)
         end
         json_data = JSON.parse(response.body)
         sales = json_data["sales"]
         sales[sales_id] = sales
         end
         return sales
       end

end
