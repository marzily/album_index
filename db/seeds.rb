10.times do
  Artist.create(name: Faker::Name.name.downcase)
end

100.times do
  Album.create(title: Faker::Hipster.word, artist_id: rand(10) + 1)
end

500.times do
  artist_id = rand(10) + 1
  album_id = Artist.find(artist_id).albums.sample.id
  Song.create(title: Faker::Book.title.downcase, album_id: album_id, artist_id: artist_id)
end
