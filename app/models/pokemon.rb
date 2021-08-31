class Pokemon < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :owner_id, :name, :owner, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { only_integer: true }, inclusion: { in: 0..100}
end
