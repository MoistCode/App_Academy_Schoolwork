
json.pokemon do
  json.merge! @poke
end
json.items do
  @poke.items.each do |item|
    json.set! item.id do
      json.merge! item
    end
  end
end
