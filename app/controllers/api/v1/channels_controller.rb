class Api::V1::ChannelsController < ApplicationController
  def create
    def index
      @channels = User.all
      render json: @channels
    end

    def show
      @channel = User.find(params[:id])
      render json: @channel
    end
  end
end
