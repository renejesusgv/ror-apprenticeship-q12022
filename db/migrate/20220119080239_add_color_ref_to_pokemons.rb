class AddColorRefToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_reference :pokemons, :color, null: false, foreign_key: true
  end
end
