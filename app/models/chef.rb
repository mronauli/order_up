class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  def ing_list
    ings = []
    dishes.each do |dish|
      dish.ingredients.each do |ing|
      ings << ing
      end
    end
    ings
  end
end
