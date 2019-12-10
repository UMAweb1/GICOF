class RenameImageProfileColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :image_profile, :image_profile_id
  end
end
