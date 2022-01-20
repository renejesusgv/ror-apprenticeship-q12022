class PokemonsController < ApplicationController
  before_action :current_pokemon, only: %i[show edit update destroy]

  def index
    @pokemons = Pokemon.page(params[:page])
  end

  def show; end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(name: pokemon_params['name'],
                           hp: pokemon_params['hp'],
                           attack: pokemon_params['attack'],
                           defense: pokemon_params['defense'],
                           image: pokemon_params['image'] || 'https://via.placeholder.com/150')

    @pokemon.color = Color.find_by(name: pokemon_params['color'])
    @pokemon.types = [Type.find_by(name: pokemon_params['type'])]
    @pokemon.abilities = [Ability.find_or_create_by!(name: pokemon_params['ability'])]
    @pokemon.save!

    redirect_to pokemons_path
  end

  def edit; end

  def update
    @pokemon.update(pokemon_params)

    redirect_to pokemon_path(@pokemon)
  end

  def destroy
    @pokemon.destroy

    redirect_to pokemons_path
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :hp,
                                    :attack, :defense,
                                    :description, :color,
                                    :image, :type, :ability)
  end

  def current_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
