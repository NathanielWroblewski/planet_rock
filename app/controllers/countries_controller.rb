class CountriesController < ApplicationController

  def index
    file = IO.read('app/assets/javascripts/world-countries.json')
    countries = JSON.parse(file)
    render json: countries
  end

end
