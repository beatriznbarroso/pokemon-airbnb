class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
