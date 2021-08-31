class PokemonsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_pokemon, only: [:show, :destroy]


  def index
    @pokemons = policy_scope(Pokemon).order(created_at: :desc)

    @markers = @pokemons.geocoded.map do |pokemon|
    {
      lat: pokemon.latitude,
      lng: pokemon.longitude,
      info_window: render_to_string(partial: "info_window", locals: { pokemon: pokemon }),
      image_url: helpers.asset_url('pokeball')
    }
    end
  end

  def new
    @pokemon = Pokemon.new
    authorize @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.owner = current_user
    authorize @pokemon

    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
  end

  def destroy
    @pokemon.destroy
    redirect_to pokemons_url, notice: 'Pokemon was successfully destroyed.'
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :description, :price, :address, :photo)
  end
end
