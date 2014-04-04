class Ingredient
  include Mongoid::Document
  field :name, type: String
  field :type, type: Integer 
  field :description, type: String
  field :degree, type: Integer

  validates :type ,:presence=> true
  validates :name ,:presence=> true,:uniqueness=>true
  validates :description ,:presence=> true


end
