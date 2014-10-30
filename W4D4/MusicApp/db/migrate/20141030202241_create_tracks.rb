class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
    	t.integer :album_id
    	t.string :track_name
    	
      t.timestamps
    end
  end
end
