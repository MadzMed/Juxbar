class Song < ApplicationRecord
  belongs_to :playlist
  has_many :likes
end
