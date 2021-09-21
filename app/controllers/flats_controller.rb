class FlatsController < ApplicationController
  def index
    # TODO: flats to be filtered based on search parameters entered by user
    @flats = Flat.all
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

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :address, :capacity, :price, photo: [])
  end

end
