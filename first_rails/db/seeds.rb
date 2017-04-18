# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create!(username: 'User1')
user2 = User.create!(username: 'User2')
user3 = User.create!(username: 'User3')
user4 = User.create!(username: 'User4')
user5 = User.create!(username: 'User5')

art1 = Artwork.create!(artist_id: 1, image_url: 'www.google.com', title: 'TITLE1')
art2 = Artwork.create!(artist_id: 2, image_url: 'www.gooogle.com', title: 'TITLE2')
art3 = Artwork.create!(artist_id: 3, image_url: 'www.goooogle.com', title: 'TITLE3')
art4 = Artwork.create!(artist_id: 4, image_url: 'www.gooooogle.com', title: 'TITLE4')
art5 = Artwork.create!(artist_id: 5, image_url: 'www.goooooogle.com', title: 'TITLE5')

view1 = ArtworkShare.create!(artwork_id: 3,viewer_id: 5)
view2 = ArtworkShare.create!(artwork_id: 4,viewer_id: 1)
view3 = ArtworkShare.create!(artwork_id: 1,viewer_id: 5)
view4 = ArtworkShare.create!(artwork_id: 2,viewer_id: 3)
view5 = ArtworkShare.create!(artwork_id: 2,viewer_id: 5)
