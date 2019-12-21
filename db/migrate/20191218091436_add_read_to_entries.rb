class AddReadToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :read, :boolean
  end
end
