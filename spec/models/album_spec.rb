require 'rails_helper'

RSpec.describe Album, type: :model do
  let(:artist) {
    Artist.create(name: 'The Rolling Tones')
  }

  let(:album) {
    Album.new(title: 'Game of Tones', artist_id: artist.id)
  }

  it 'is valid with valid attributes' do
    expect(album).to be_valid
  end

  it 'is invalid if title is not present' do
    album.title = nil

    expect(album).to_not be_valid
  end

  it 'is invalid if title is blank' do
    album.title = ''

    expect(album).to_not be_valid
  end

  it 'must belong to an artist' do
    album.artist_id = nil

    expect(album).to_not be_valid
  end

  it 'must belong to an artist in the database' do
    album.artist_id = 2000

    expect(album).to_not be_valid
  end
end
