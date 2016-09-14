10.times do
  Artist.create(name: Faker::Name.name)
end

100.times do
  Album.create(title: Faker::Hipster.word, artist_id: rand(10) + 1)
end

500.times do
  album_id = rand(10) + 1
  artist_id = Album.find(album_id).artist_id
  Song.create(title: Faker::Book.title, album_id: album_id, artist_id: artist_id)
end
