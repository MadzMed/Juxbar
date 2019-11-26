class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :album
      t.string :category
      t.integer :duration
      t.string :title
      t.bigint :deezer_id
      t.string :composer
      t.references :playlist, foreign_key: true

      t.timestamps
    end
  end
end
