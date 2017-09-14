class Channel < ApplicationRecord
  has_many :statuses
  belongs_to :user
  #{has_many :listeners, class_name: "User", foreign_key: "current_channel_id"}
end
