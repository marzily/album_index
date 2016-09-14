class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album

  validates :title, :artist, presence: true
  validates_presence_of :album
end
