class Session < ApplicationRecord
  belongs_to :bar
  belongs_to :playlist
end
