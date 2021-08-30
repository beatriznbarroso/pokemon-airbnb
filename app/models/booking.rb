class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates :user, :pokemon, :start_time, :end_time, presence: true
  validate :owner?, :already_booked?

  private

  # def max_reached?
  #   if trip.participations.count >= trip.max_participants
  #     errors.add(:base, "Trip has enough people, choose another one")
  #   end
  # end

  def owner?
    if pokemon.owner == user
      errors.add(:base, "You can't book on your own pokemon!")
    end
  end

  def already_booked?
    if pokemon.users.include? user
      errors.add(:base, "You already booked this pokemon!")
    end
  end
end
