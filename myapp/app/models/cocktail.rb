class Cocktail
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :rating, type: Integer
  belongs_to :user
  has_many :component
end
