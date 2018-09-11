# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do 
  User.destroy_all
  
  users = User.create([ 
    {username: "LaLA"},
    {username: 'Austin'}
  ])
  
  artworks = Artwork.create([
    {title: 'good stuff', image_url: 'www.stuff.com/img', artist_id: users.last.id},
    {title: 'flowers', image_url: 'www.flowers.com/img', artist_id: users.last.id},
    {title: 'pizza', image_url: 'www.pizza.com/img', artist_id: users.first.id},
    {title: 'Untitled', image_url: 'www.La.com/img', artist_id: users.first.id}
    ])
    
  shares = ArtworkShare.create([
    {viewer_id: users.last.id, artwork_id: artworks[1].id},
    {viewer_id: users.first.id, artwork_id: artworks[1].id},
    {viewer_id: users.first.id, artwork_id: artworks[2].id},
    {viewer_id: users.last.id, artwork_id: artworks[1].id}
    ])
end 