class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy chef ]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

    def update
      if @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @restaurant.destroy
      redirect_to restaurants_path
    end

    # def top
    #   @restaurants = Restaurant.where(stars: 5)
    # end
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :category)
    end
end
