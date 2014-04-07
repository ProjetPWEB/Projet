class Component
  include Mongoid::Document
  field :quantity, type: Integer
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail ,:presence=> true,:uniqueness=>false
  validates :ingredient ,:presence=> true
  validates :quantity ,:presence=> true
end
