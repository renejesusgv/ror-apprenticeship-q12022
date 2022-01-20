# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'CSV'

file_name = File.expand_path(File.join(File.dirname(__FILE__), 'pokemons.csv'))
CSV.foreach(file_name, headers: true) do |row|
  hash = row.to_hash
  abilities = []
  types = []

  color = Color.find_or_create_by!(name: hash['color']) if hash['color'].presence

  abilities << Ability.find_or_create_by!(name: hash['ability1']) if hash['ability1'].presence
  abilities << Ability.find_or_create_by!(name: hash['ability2']) if hash['ability2'].presence
  abilities << Ability.find_or_create_by!(name: hash['ability3']) if hash['ability3'].presence

  types << Type.find_or_create_by!(name: hash['type1']) if hash['type1'].presence
  types << Type.find_or_create_by!(name: hash['type2']) if hash['type2'].presence

  pokemon = Pokemon.find_or_initialize_by(
    name: hash['name'], hp: hash['hp'], attack: hash['attack'],
    defense: hash['defense'],
    image: "https://play.pokemonshowdown.com/sprites/bw/#{hash['name'].downcase.gsub(/[()'.\-]/, '').gsub(/\s/, '-')}.png"
  )
  pokemon.color = color
  pokemon.types = types
  pokemon.abilities = abilities
  pokemon.save!
end
