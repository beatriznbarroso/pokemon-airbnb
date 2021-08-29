class PokemonsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

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
      redirect_to pokemons_path
    else
      render :new
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :description, :price, :start_date, :end_date)
  end
end