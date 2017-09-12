class CreateChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :channels do |t|
      t.string :owner
      t.string :current_song_uri
      t.string :current_song
      t.string :current_song_album
      t.string :current_song_artist
      t.string :current_song_progress
      t.timestamps
    end
  end
end
