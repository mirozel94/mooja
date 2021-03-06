class Surfcamp < ApplicationRecord
  has_many :discounts, dependent: :nullify
  has_many :bookings, dependent: :nullify
  has_attachments :photos
  geocoded_by :address
  monetize :price_cents
  after_validation :geocode, if: :address_changed?

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :name, presence: true
  validates :address, presence: true
end
