json.array!(@operators) do |operator|
  json.extract! operator, :id, :cc, :name, :position
  json.url operator_url(operator, format: :json)
end
