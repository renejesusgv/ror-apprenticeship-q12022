class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :types, :name, unique: true
  end
end
