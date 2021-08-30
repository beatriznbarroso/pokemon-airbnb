class RemoveStartTimeFromPokemons < ActiveRecord::Migration[6.0]
  def change
    remove_column(:pokemons, :start_date, :datetime)
    remove_column(:pokemons, :end_date, :datetime)
  end
end
