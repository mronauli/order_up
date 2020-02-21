# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
require "rails_helper"

RSpec.describe "on a chef show page" do
  context "as a visitor" do
    it "can see a list of all ingredients the chef has used" do
      chef_1 = Chef.create(name: "Boyardee")
      chef_2 = Chef.create(name: "Boyardee")
      dish_1 = Dish.create(name: "Pizza", description: "Very nice", chef: chef_1)
      dish_2 = Dish.create(name: "Spaghetti", description: "Yum", chef: chef_1)
      dish_3 = Dish.create(name: "Ravioli", description: "Delish", chef: chef_2)
      ingredient_1 = Ingredient.create(name: "Cheese", calories: 50, dishes: [dish_1])
      ingredient_2 = Ingredient.create(name: "Bread", calories: 100, dishes: [dish_1, dish_2])
      ingredient_3 = Ingredient.create(name: "Pepperoni", calories: 30, dishes: [dish_1])
      ingredient_4 = Ingredient.create(name: "Cilantro", calories: 30, dishes: [dish_2, dish_3])

      visit "/chefs/#{chef_1.id}"
      click_link "My Ingredients"
      expect(current_path).to eq("/chef_ingredients/#{chef_1.id}")
      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(chef_1.name)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
      expect(page).to_not have_content(ingredient_4.name)
    end
  end
end
