class CreateInquiryReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiry_replies do |t|
      t.integer :inquiry_id
      t.text :reply_content

      t.timestamps
    end
  end
end
