class Ingredient
  include Mongoid::Document
  field :name, type: String
  field :type, type: Integer
  field :description, type: String
  field :degree, type: Integer
end
