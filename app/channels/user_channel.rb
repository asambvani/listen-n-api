class UserChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream from "user_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
