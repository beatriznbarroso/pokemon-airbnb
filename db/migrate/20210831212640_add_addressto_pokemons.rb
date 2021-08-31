class AddAddresstoPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :address, :string
  end
end
