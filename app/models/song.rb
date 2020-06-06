class Song < ApplicationRecord
  belongs_to :playlist
  has_many :likes, dependent: :destroy
  validates :artist, presence: true
  validates :title, presence: true
  validates :duration, presence: true
end
