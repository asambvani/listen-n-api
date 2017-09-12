class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :spotify_id
      t.string :display_name
      t.string :profile_photo_url
      t.string :spotify_profile_url
      t.string :authorization_code
      t.integer :current_channel_id
      t.timestamps
    end
  end
end
