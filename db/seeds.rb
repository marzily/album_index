# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  Artist.create(name: Faker::Name.name)
end

100.times do
  Album.create(title: Faker::Hipster.word, artist_id: rand(10) + 1)
end

500.times do
  Song.create(title: Faker::Book.title, artist_id: rand(10) + 1, album_id: rand(100) + 1)
end
