class Post < ApplicationRecord
  validates :title, :sub, :author, presence: true

  belongs_to :sub
  belongs_to :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id
end
