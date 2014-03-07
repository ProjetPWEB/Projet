json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :type, :description, :degree
  json.url ingredient_url(ingredient, format: :json)
end
