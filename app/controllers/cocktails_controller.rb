class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.order(:name)
    @cocktail = Cocktail.new
    @dose = Dose.new
    @ingredients = Ingredient.all
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
    while Cocktail.find_by_name(params[:cocktail][:name])
      params[:cocktail][:name] = "nouveau " + params[:cocktail][:name]
    end
    cocktail = Cocktail.new(params_cocktail)
    if cocktail.save
      ingredient = Ingredient.find(params[:cocktail][:dose][:ingredient])
      dose = Dose.new(ingredient: ingredient, quantity: params[:cocktail][:dose][:quantity])
      dose.cocktail = cocktail
      if dose.save
        redirect_to cocktail_path(cocktail)
      else
        redirect_to cocktails_path
      end
    else
      redirect_to cocktails_path
    end
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end
end
