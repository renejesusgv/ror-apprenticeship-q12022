# frozen_string_literal: true

class CreateAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :abilities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :abilities, :name, unique: true
  end
end
