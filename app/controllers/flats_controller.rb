class FlatsController < ApplicationController
  def index
    if flat_search_params.present?
      country_name = country_name(flat_search_params[:country])
      flats = Flat.search_by_country_capacity(country_name)
      @flats = flats.find_all { |flat| flat.capacity >= flat_search_params[:guests].to_i }
    else
      @flats = Flat.all
    end
  end

  def root
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :address, :capacity, :price, photo: [])
  end

  def flat_search_params
    params.permit(:country, :checkin, :checkout, :guests)
  end

  def country_name(country_code)
    country = ISO3166::Country[country_code]
    country.name
  end

end
