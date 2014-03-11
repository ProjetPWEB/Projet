json.array!(@bars) do |bar|
  json.extract! bar, :id, :ingr, :quantity
  json.url bar_url(bar, format: :json)
end
