class User < ApplicationRecord
  has_many :pokemons, foreign_key: :owner_id, class_name: 'Pokemon'
  has_one_attached :avatar, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
