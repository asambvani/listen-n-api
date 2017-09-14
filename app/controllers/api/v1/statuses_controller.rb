class Api::V1::StatusesController < ApplicationController
  status_params = {status_channel: 1}

  def create
    current_user = User.find(1)
    status = current_user.channel.statuses.build(params[:status])
    if status.save
      byebug
      ActionCable.server.broadcast 'user_channel',
      status_channel: status.chanel_id,
      current_song_uri: status.current_song_uri,
      current_song: status.current_song,
      current_song_album: status.current_song_album,
      current_song_artist: status.current_song_artist,
      current_song_progress: status.current_song_progress
    end
  end

private

end
