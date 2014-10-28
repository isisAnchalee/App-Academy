class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, null: false
      t.text :description, null: false
      
      t.timestamps
    end
    add_index :cats, [:color, :name, :sex]
  end
end
