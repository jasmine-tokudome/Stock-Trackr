class ProductApi
  class << self
    def search(params = {})
      # paramsを使って柔軟に検索パラメータを追加できる想定
      # （だが、下記URLは静的なレスポンスしか返さないので未実装）
      uri = URI.parse('https://api.shop-pro.jp/v1/shop.json')
      json = Net::HTTP.get(uri)
      data_list = JSON.parse(json, symbolize_names: true)
      data_list.map do |data|
        Product.new(data)
      end
    end
  end
end