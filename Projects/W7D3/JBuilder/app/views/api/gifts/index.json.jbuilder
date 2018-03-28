# json.gifts do
#   gifts_arr = []
#   @gifts.each do |gift|
#     gifts_arr += (json.partial! 'api/gifts/gift', gift: gift)
#   end
#   json.array! gifts_arr
# end

json.array! @gifts do |gift|
  json.partial! 'api/gifts/gift', gift: gift
end
