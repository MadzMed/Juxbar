class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :album
      t.string :category
      t.float :duration
      t.string :title
      t.bigint :deezer_id
      t.string :composer

      t.timestamps
    end
  end
end
