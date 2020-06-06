class Session < ApplicationRecord
  belongs_to :bar
  has_many :playlists
  validates :description, presence: true, length: { in: 50..260 }
  validates :category, presence: true
end
