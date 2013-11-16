class CountriesController < ApplicationController

  def index
    file = IO.read('app/assets/javascripts/world-countries.json')
    countries = JSON.parse(file)
    render json: countries
  end

  def show
    country = Country.find_by(country: params[:country])
    render json: country.attributes.with_indifferent_access.except(:id)
  end
end
