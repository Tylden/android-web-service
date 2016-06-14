json.name do
  json.id    @name.id
  json.first @name.first
  json.last @name.last

  #json.artist_id @name.artist ? @name.artist.id : nil
end
