require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "#total_cals" do
    it "can calculate total calories of a dish" do
      chef_1 = Chef.create(name: "Boyardee")
      dish_1 = Dish.create(name: "Pizza", description: "Very nice", chef: chef_1)
      ingredient_1 = Ingredient.create(name: "Cheese", calories: 50, dishes: [dish_1])
      ingredient_2 = Ingredient.create(name: "Bread", calories: 100, dishes: [dish_1])
      ingredient_3 = Ingredient.create(name: "Pepperoni", calories: 30, dishes: [dish_1])
      expect(dish_1.total_cals).to eq(180)
    end
  end
end
