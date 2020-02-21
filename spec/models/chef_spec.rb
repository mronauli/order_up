require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "#ing_list" do
    chef_1 = Chef.create(name: "Boyardee")
    chef_2 = Chef.create(name: "Boyardee")
    dish_1 = Dish.create(name: "Pizza", description: "Very nice", chef: chef_1)
    dish_2 = Dish.create(name: "Spaghetti", description: "Yum", chef: chef_1)
    dish_3 = Dish.create(name: "Ravioli", description: "Delish", chef: chef_2)
    ingredient_1 = Ingredient.create(name: "Cheese", calories: 50, dishes: [dish_1])
    ingredient_2 = Ingredient.create(name: "Bread", calories: 100, dishes: [dish_1, dish_2])
    ingredient_3 = Ingredient.create(name: "Pepperoni", calories: 30, dishes: [dish_1])
    ingredient_4 = Ingredient.create(name: "Cilantro", calories: 30, dishes: [dish_2, dish_3])
    ingredient_2 = Ingredient.create(name: "Chives", calories: 20, dishes: [dish_3])
    expect(chef_1.ing_list).to eq([ingredient_1, ingredient_2, ingredient_3, ingredient_4,])
  end
end
