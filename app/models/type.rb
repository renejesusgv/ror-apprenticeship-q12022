class Type < ApplicationRecord
  has_and_belongs_to_many :pokemons

  validates :name, presence: true, uniqueness: true,
            inclusion: { in: %w[Bug Dark Dragon Electric Fighting
 Fire Flying Ghost Grass Ground Ice Normal Poison Psychic Rock Steel Water] }
end
