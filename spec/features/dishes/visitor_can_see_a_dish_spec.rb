require "rails_helper"

RSpec.describe "on a dish show page" do
  context "as a visitor" do
    it "can see a dish, its chef and list of ingredients" do
      chef_1 = Chef.create(name: "Boyardee")
      dish_1 = Dish.create(name: "Pizza", description: "Very nice", chef: chef_1)
      dish_2 = Dish.create(name: "Spaghetti", description: "Yum", chef: chef_1)
      ingredient_1 = Ingredient.create(name: "Cheese", calories: 50, dishes: [dish_1])
      ingredient_2 = Ingredient.create(name: "Bread", calories: 100, dishes: [dish_1, dish_2])
      ingredient_3 = Ingredient.create(name: "Pepperoni", calories: 30, dishes: [dish_1])
      ingredient_4 = Ingredient.create(name: "Cilantro", calories: 30, dishes: [dish_2])

      visit "/dishes/#{dish_1.id}"
      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(chef_1.name)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
      expect(page).to_not have_content(ingredient_4.name)
    end

    it "can see the total calories of the dish" do
      chef_1 = Chef.create(name: "Boyardee")
      dish_1 = Dish.create(name: "Pizza", description: "Very nice", chef: chef_1)
      dish_2 = Dish.create(name: "Spaghetti", description: "Yum", chef: chef_1)
      ingredient_1 = Ingredient.create(name: "Cheese", calories: 50, dishes: [dish_1])
      ingredient_2 = Ingredient.create(name: "Bread", calories: 100, dishes: [dish_1, dish_2])
      ingredient_3 = Ingredient.create(name: "Pepperoni", calories: 30, dishes: [dish_1])
      ingredient_4 = Ingredient.create(name: "Cilantro", calories: 30, dishes: [dish_2])

      visit "/dishes/#{dish_1.id}"
      expect(page).to have_content(180)
      expect(page).to_not have_content(130)
    end
  end
end
