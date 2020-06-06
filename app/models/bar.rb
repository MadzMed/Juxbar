class Bar < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :sessions, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true, length: { in: 50..260 }
end
