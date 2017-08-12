class CitiesController < ApplicationController
  before_action :auth_admin

  def index
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(params[:city].permit(:name, :country, :photo))

    if @city.save
      redirect_to root_url
    else
      render 'new'
    end
  end
end
