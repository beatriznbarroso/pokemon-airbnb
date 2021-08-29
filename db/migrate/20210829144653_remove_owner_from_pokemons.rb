class RemoveOwnerFromPokemons < ActiveRecord::Migration[6.0]
  def change
    remove_column :pokemons, :owner_id, :bigint
  end
end
