class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
    	t.integer :band_id
    	t.string :album_name
    	
      t.timestamps
    end
  end
end
