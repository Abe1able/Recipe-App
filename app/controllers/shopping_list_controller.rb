class ShoppingListsController < ApplicationController
def index
  @receipe=Receipe.includes(receipe_foods: [:food]).params([:receipe_id])
  @receipe_foods=@receipe.receipe_foods
  @total=sum(receipe_foods)
end
def sum(receipe_foods)
  total=0
  receipe_foods.each do |item|
    total+=item.food.price* item.quantity.to_i
  end
  total
end

end