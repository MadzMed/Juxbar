class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :bar, foreign_key: true
      t.text :description
      t.references :playlist, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
