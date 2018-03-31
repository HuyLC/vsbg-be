class CreateBags < ActiveRecord::Migration[5.1]
  def change
    create_table :bags do |t|
      t.string :post_id
      t.string :full_picture_url
      t.integer :likes_count
      t.string :name
      t.string :fb_id
      t.string :object_id
      t.string :photo

      t.timestamps
    end
  end
end
