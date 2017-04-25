class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :subs, :moderator_id, :user_id
  end
end
