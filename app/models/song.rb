class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album

  validates :title, :artist, :album_id, presence: true
  validate :album_in_db

  def album_in_db
    unless album_id.nil? || album_id.between?(1, 500)
      errors.add(:album_id, 'Album must be in db.')
    end
  end

  def self.search(title)
    Song.where(title: title.downcase)
  end
end
