class AddOwnerToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_reference :pokemons, :owner, index: true, foreign_key: { to_table: :users }
  end
end
