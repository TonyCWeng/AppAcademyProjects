class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.integer :sub_id, null: false
      t.integer :author_id, null: false
      t.text :content

      t.timestamps
    end
  end
end
