class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer :user_id
      t.integer :inquiry_reply_id
      t.integer :title
      t.text :content

      t.timestamps
    end
  end
end
