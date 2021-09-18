class FlatsController < ApplicationController
  def index
    # TODO: flats to be filtered based on search parameters entered by user
    @flats = Flat.all
  end
end
