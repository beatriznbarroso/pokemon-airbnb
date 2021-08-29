class PokemonsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_pokemon, only: [:show]


  def index
    @pokemons = Pokemon.all
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.owner = current_user

    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  def show
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :description, :price, :start_date, :end_date, :photo)
  end
end
