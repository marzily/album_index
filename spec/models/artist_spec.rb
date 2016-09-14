require 'rails_helper'

RSpec.describe Artist, type: :model do
  let(:artist) {
    Artist.new(name: 'The Rolling Tones')
  }

  it 'is valid with valid attributes' do
    expect(artist).to be_valid
  end

  it 'is invalid without a name' do
    artist.name = nil

    expect(artist).to_not be_valid
  end

  it 'is invalid if name is an empty string' do
    artist.name = ""

    expect(artist).to_not be_valid
  end

  it 'is invalid if artist already exists' do
    Artist.create(name: 'The Rolling Tones')

    expect(artist).to_not be_valid
  end

  it 'is not case sensitive' do
    Artist.create(name: 'The Rolling tones')

    expect(artist).to_not be_valid
  end
end
