class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :songs

  validates :title, :artist, presence: true

  def self.search(title)
    albums_by_title(title).map(&:songs).flatten
  end

  def self.albums_by_title(title)
    Album.where(title: title.downcase)
  end

  def print_title
    title.split(' ').map(&:capitalize).join(' ')
  end
end
