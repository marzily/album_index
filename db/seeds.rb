10.times do
  Artist.create(name: Faker::Name.name)
end

100.times do
  Album.create(title: Faker::Hipster.word.capitalize, artist_id: rand(10) + 1)
end

500.times do
  artist_id = rand(10) + 1
  album_id = Artist.find(artist_id).albums.sample.id
  Song.create(title: Faker::Book.title, album_id: album_id, artist_id: artist_id)
end
