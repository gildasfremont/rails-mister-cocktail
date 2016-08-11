# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cocktail.destroy_all
Dose.destroy_all

12.times do
  Ingredient.create(name: Faker::Beer.style)
end

15.times do
  cocktail = Cocktail.create(name: Faker::StarWars.specie)
  rand(2..6).times do
    quantity = rand(1..6)
    ingredient = Ingredient.all.sample
    if !cocktail.ingredients.include?(ingredient)
      dose = Dose.new({
        ingredient: ingredient,
        cocktail: cocktail,
        description: quantity.to_s + 'cl',
        quantity: quantity
      })
      dose.save
    end
  end
end
