class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :songs

  validates :title, :artist, presence: true
end
