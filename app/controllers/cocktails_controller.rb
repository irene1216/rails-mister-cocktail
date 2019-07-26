class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update]
  def index
    @cocktails = Cocktail.all
    @random_cocktails = Cocktail.random
    if params[:search]
      @cocktails = Cocktail.search(params[:search])
    else
      @cocktails = Cocktail.all
      @random_cocktails = Cocktail.random
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def randomizer
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def search
    @cocktails = Cocktail.search(params[:search])
  end

  def edit
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path
    else
      render cocktail_path(@cocktail)
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new(cocktail: @cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.required(:cocktail).permit(:name, :description, :search, :random)
  end
end
