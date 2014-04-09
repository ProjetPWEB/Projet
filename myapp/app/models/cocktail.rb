class Cocktail
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :rating, type: Integer 
  belongs_to :user
  has_many :components

  validates :user ,:presence=> true,:uniqueness=>false
  validates :name ,:presence=> true,:uniqueness=>true
  validates :description ,:presence=> true
end
