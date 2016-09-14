class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :songs

  validates :title, :artist, presence: true

  def self.search(title)
    Album.where(title: title)
  end
end
