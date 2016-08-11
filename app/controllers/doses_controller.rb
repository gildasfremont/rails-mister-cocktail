class DosesController < ApplicationController
  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    cocktail = Cocktail.find(params[:cocktail_id])
    ingredient = Ingredient.find(params[:dose][:ingredient])
    existing_dose = Dose.where(ingredient: ingredient, cocktail: cocktail).first
    if existing_dose
      existing_dose.quantity = params[:dose][:quantity]
      existing_dose.description = params[:dose][:description]
      existing_dose.save
    else
      dose = Dose.new
      dose.quantity = params[:dose][:quantity]
      dose.description = params[:dose][:description]
      dose.ingredient = ingredient
      dose.cocktail = cocktail
      dose.save
    end
    redirect_to cocktail_path(cocktail)
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
  end
end
