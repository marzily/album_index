class Artist < ActiveRecord::Base
  has_many :albums, dependent: :destroy
  
  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false
end
