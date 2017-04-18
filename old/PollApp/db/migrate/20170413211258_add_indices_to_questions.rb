class AddIndicesToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_index :questions, :poll_id
  end
end
