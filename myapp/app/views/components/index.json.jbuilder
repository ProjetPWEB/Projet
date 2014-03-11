json.array!(@components) do |component|
  json.extract! component, :id, :ingr, :quantity
  json.url component_url(component, format: :json)
end
