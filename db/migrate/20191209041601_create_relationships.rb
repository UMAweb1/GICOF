class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :follower, foreign_key: {to_table: :users}
      t.references :following, foreign_key: {to_table: :users}
      t.boolean :good_user, default: false
      t.boolean :block, default: false

      t.timestamps null: false

    end
	add_index :relationships, [:follower_id, :following_id], unique: true
  end
end
