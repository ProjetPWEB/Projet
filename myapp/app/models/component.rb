class Component
  include Mongoid::Document
  field :ingr, type: Ingredient
  field :quantity, type: Integer
  belongs_to :cocktail
end
