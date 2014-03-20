class Bar
  include Mongoid::Document
  

  field :quantity, type: Integer
  belongs_to :user
  belongs_to :ingredient
end
