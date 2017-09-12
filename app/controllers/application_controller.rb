class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  def index
    response = RestClient.post('https://api.instagram.com/oauth/access_token', {client_secret: ENV['secret'], client_id: ENV['client_id'], redirect_uri: 'http://localhost:3000/', code: params[:code], grant_type: 'authorization_code'})
  end


end
