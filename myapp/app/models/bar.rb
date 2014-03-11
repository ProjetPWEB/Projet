class Bar
  include Mongoid::Document
  field :ingr, type: Ingredient
  field :quantity, type: Integer
  belongs_to :user
end
