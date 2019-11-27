class AddPhotoToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :photo_artist, :string
    add_column :songs, :photo_album, :string
  end
end
