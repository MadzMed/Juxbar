class AddPhotoLargeToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :photo_large, :string
  end
end
