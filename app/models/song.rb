class Song < ApplicationRecord
  belongs_to :playlist
  has_many :likes, dependent: :destroy
end
