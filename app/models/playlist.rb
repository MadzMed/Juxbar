class Playlist < ApplicationRecord
  belongs_to :user
  belongs_to :session
  has_many :songs
end
