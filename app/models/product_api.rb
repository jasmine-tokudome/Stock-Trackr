class ProductApi
 before_action: set_oauth2_client

  class << self
    def search(params = {product_id})
      # paramsを使って柔軟に検索パラメータを追加できる想定
      # （だが、下記URLは静的なレスポンスしか返さないので未実装）
      uri = URI.parse('https://api.shop-pro.jp/v1/products/')
      json = Net::HTTP.get(uri)
      #  request['Authorization'] = "Bearer #{ENV['colorme_access_token']}"
      data_list = JSON.parse(json, symbolize_names: true)
      data_list.map do |data|
        Product.new(data)
      end
    end
  end

  private

  def set_oauth2_client
    client_id = ENV['colorme_client_id']
    client_secret = ENV['colorme_client_secret']
    # flow_type = ENV['colorme_code']
    # authorize_url = https://api.shop-pro.jp/oauth/authorize
    # token_url =  https://api.shop-pro.jp/oauth/token
    # required_scopes = read_products
    @client = OAuth2::Client.new(client_id, client_secret)
  end

end