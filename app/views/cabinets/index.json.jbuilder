json.array!(@cabinets) do |cabinet|
  json.extract! cabinet, :id
  json.url cabinet_url(cabinet, format: :json)
end
