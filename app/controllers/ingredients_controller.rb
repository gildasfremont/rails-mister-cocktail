class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @ingredients = Ingredient.all
    @cocktails = @ingredient.cocktails
    @cocktail = Cocktail.new
    @dose = Dose.new
  end
end
