class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.integer :status_channel
      t.string :current_song_uri
      t.string :current_song
      t.string :current_song_album
      t.string :current_song_artist
      t.string :current_song_progress
      t.timestamps
    end
  end
end
