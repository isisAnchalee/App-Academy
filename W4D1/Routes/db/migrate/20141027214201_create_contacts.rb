class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :user_id

      t.timestamps
    end

    add_index :contacts, [:user_id, :email], :unique => true

  end
end
