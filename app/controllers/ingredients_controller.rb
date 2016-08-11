class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @cocktails = @ingredient.cocktails
    @cocktail = Cocktail.new
  end
end
