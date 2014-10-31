class ChangeModerator < ActiveRecord::Migration
  def change
    rename_column :subs, :moderator, :user_id
  end
end
