class CreateGamegenres < ActiveRecord::Migration[5.2]
  def change
    create_table :gamegenres do |t|
      t.string :gamegenre
      t.timestamps
    end
  end
end
