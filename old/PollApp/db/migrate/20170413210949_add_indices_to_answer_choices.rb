class AddIndicesToAnswerChoices < ActiveRecord::Migration[5.0]
  def change
    add_index :answer_choices, :question_id
  end
end
