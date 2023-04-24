class OauthController < ApplicationController
  before_action :set_oauth2_client

  def oauth2_authorize
    authorize_url = @client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/oauth2_callback')

    redirect_to authorize_url
  end

  def oauth2_callback
    token = @client.auth_code.get_token(params[:code], :redirect_uri => 'http://localhost:3000/oauth2_callback')

    # アクセストークンを使用してAPIにアクセスする
    response = token.get('/api/resource', :params => {'query_foo' => 'bar'}, :headers => {'Accept' => 'application/json'})

    # アクセストークンを取得する際にAuthorizationヘッダを指定する
    token = client.client_credentials.get_token(:headers => {'Authorization' => 'Bearer 'ENV[colorme_access_token]''})

    # APIにリクエストを送信する際にAuthorizationヘッダを指定する
    response = token.get('/api/resource', :headers => {'Authorization' => 'Bearer 'ENV[colorme_access_token]'', 'Accept' => 'application/json'})

    render :json => response
  end

  private

  def set_oauth2_client
    client_id = ENV[colorme_client_id]
    client_secret = ENV[colorme_client_secret]
    flow_type: authorizationCode
    authorize_url: https://api.shop-pro.jp/oauth/authorize
    token_url: https://api.shop-pro.jp/oauth/token
    required_scopes: read_products

    @client = OAuth2::Client.new(client_id, client_secret, :site => site, :authorize_url => authorize_url, :token_url => token_url)
  end
end

