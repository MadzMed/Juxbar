class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.datetime :started_at

      t.timestamps
    end
  end
end