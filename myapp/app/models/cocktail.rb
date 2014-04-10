class Cocktail
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :rating, type: Integer 
  belongs_to :user
  has_many :components
  validates_numericality_of :rating, :allow_nil => false, :greater_than => -1, :less_than_or_equal_to => 20, :only_integer => true
  validates :user ,:presence=> true,:uniqueness=>false
  validates :name ,:presence=> true,:uniqueness=>true
  validates :description ,:presence=> true
end
