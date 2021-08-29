class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.bigint :owner_id
      t.integer :price

      t.timestamps
    end
  end
end
