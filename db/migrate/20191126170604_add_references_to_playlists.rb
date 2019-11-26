class AddReferencesToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_reference :playlists, :session, foreign_key: true
  end
end
