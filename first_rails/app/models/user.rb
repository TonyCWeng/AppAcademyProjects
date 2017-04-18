class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    class_name: :Artwork,
    primary_key: :id,
    foreign_key: :artist_id

  has_many :shared_artworks,
    through: :artworks,
    source: :artwork_shares
end
