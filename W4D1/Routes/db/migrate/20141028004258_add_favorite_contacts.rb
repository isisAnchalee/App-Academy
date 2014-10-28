class AddFavoriteContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :favorite_contacts, :string
  end
end
