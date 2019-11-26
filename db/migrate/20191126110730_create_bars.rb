class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
