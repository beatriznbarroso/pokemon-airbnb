class User < ApplicationRecord
  # Owns pokemons
  has_many :o_pokemons, foreign_key: :owner_id, class_name: 'Pokemon'

  # Books pokemons
  has_many :bookings
  has_many :pokemons, through: :bookings
  has_one_attached :avatar, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
