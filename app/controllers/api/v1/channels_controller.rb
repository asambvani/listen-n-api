class Api::V1::ChannelsController < ApplicationController
  def create
    channel = current_user.channel.build(channel_params)
  end
end
