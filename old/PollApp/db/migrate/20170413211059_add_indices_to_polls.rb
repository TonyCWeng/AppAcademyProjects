class AddIndicesToPolls < ActiveRecord::Migration[5.0]
  def change
    add_index :polls, :author_id
  end
end
