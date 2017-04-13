class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.string :title, uniqueness: true, null: false
      t.integer :author_id, null: false
      t.timestamps
    end
  end
end
