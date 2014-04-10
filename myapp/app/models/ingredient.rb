class Ingredient
  include Mongoid::Document
  field :name, type: String
  field :type, type: Integer 
  field :description, type: String
  field :degree, type: Integer

  validates :type ,:presence=> true
  validates :name ,:presence=> true,:uniqueness=>true
  validates :description ,:presence=> true
  validates_numericality_of :type, :allow_nil => false, :greater_than => -1, :less_than_or_equal_to => 2, :only_integer => true

end
