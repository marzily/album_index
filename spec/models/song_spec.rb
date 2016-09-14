require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:artist) {
    Artist.create(name: 'Lenny')
  }

  let(:album) {
    artist.albums.create(title: 'Jets')
  }

  let(:song) {
    album.songs.new(title: 'Lenny and the Jets', artist_id: artist.id)
  }

  it 'is valid with valid attributes' do
    expect(song).to be_valid
  end

  it 'is not valid if title is missing' do
    song.title = nil

    expect(song).to_not be_valid
  end

  it 'is not valid if title is an empty string' do
    song.title = ''

    expect(song).to_not be_valid
  end

  it 'must belong to an artist' do
    song.artist_id = nil

    expect(song).to_not be_valid
  end

  it 'must belong to an artist in the database' do
    song.artist_id = 400

    expect(song).to_not be_valid
  end

  it 'must belong to an album' do
    song.album_id = nil

    expect(song).to_not be_valid
  end

  it 'must belong to an album in the database' do
    song.album_id = 700

    expect(song).to_not be_valid
  end

end
