class Bar
  include Mongoid::Document
  field :quantity, type: Integer
  belongs_to :user
  belongs_to :ingredient

  validates :user ,:presence=> true
  validates :ingredient ,:presence=> true,:uniqueness=>true
end
