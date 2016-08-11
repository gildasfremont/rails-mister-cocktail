class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.order(:name)
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail = Cocktail.new(params_cocktail)
    cocktail.save
    redirect_to cocktail_path(cocktail)
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end
end
