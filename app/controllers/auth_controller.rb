class AuthController < ApplicationController
  protect_from_forgery with: :exception
  REDIRECT_URI = 'http://localhost:3000/login'

  def login
    auth_response = RestClient.post('https://accounts.spotify.com/api/token',
    {redirect_uri: REDIRECT_URI, code: params[:code], grant_type: 'authorization_code', client_id: '63fb384bf7344dd391015f1e54adb289', client_secret: 'acec74e46ebe40b2abae501c14d7a71c'}, {content_type: 'application/x-www-form-urlencoded'})
    auth_obj = JSON.parse(auth_response.body)
    access_token = auth_obj["access_token"]
    expires_in = auth_obj["expires_in"]
    token_type = auth_obj["token_type"]
    refresh_token  = auth_obj["refresh_token"]
    user_response = RestClient.get('https://api.spotify.com/v1/me',{Authorization: "#{token_type} #{access_token}"})
    user_obj = JSON.parse(user_response.body)
    # t.string "spotify_id"
    # t.string "display_name"
    # t.string "profile_photo_url"
    # t.string "spotify_profile_url"
    # t.string "authorization_code"
    # t.integer "current_channel_id"
    spotify_id = user_obj["id"]
    display_name = user_obj["display_name"]
    if(user_obj["images"].length>0)
      profile_photo_url = user_obj["images"][0]["url"]
    end
    spotify_profile_url = user_obj["external_urls"]["spotify"]
    @user = User.find_or_create_by(spotify_id: spotify_id)
    @user.spotify_id = spotify_id
    @user.display_name = display_name
    @user.profile_photo_url = profile_photo_url
    @user.spotify_profile_url = spotify_profile_url
    @user.authorization_code = access_token
    @user.save
    # @channel = Channel.find_or_create_by(owner_id: @user.id)
    # @channel.owner_id = @user.id
    # @channel.save
    # render json: @channel
    redirect_to "http://localhost:3001?user=#{@user.id}"
  end

end
