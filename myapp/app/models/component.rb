class Component
  include Mongoid::Document
  field :ingr, type: Ingredient
  field :quantity, type: Integer
  belongs_to :cocktail

  validates :cocktail ,:presence=> true,:uniqueness=>true
  validates :ingredient ,:presence=> true
  validates :quantity ,:presence=> true
end
