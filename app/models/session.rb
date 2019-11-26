class Session < ApplicationRecord
  belongs_to :bar
  has_many :playlists
end
