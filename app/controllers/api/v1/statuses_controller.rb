class Api::V1::StatusesController < ApplicationController
  status_params = {status_channel: 1}

  def create
    current_user = User.find(1)
    status = current_user.channel.statuses.build(status_params)
    if status.save
      ActionCable.server.broadcast 'user_channel',
      channel_id: status.channel_id,
      current_song_uri: status.current_song_uri,
      current_song: status.current_song,
      current_song_album: status.current_song_album,
      current_song_artist: status.current_song_artist,
      current_song_progress: status.current_song_progress,
      thumbnail_url: status.thumbnail_url
    end
    render json: {message: "success!"}
  end

private
def status_params
  params.require(:status).permit(:status_channel, :current_song_uri, :current_song, :current_song_album, :current_song_artist, :current_song_progress, :thumbnail_url)
end

end
