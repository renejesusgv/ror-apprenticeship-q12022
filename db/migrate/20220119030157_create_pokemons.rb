class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.float :hp
      t.float :attack
      t.float :defense
      t.text :description
      t.string :image
      t.timestamps
    end
    add_index :pokemons, :name, unique: true
  end
end
