json.contact do
  json.id    @contact.id
  json.first @contact.first
  json.last @contact.last

  #json.artist_id @contact.artist ? @contact.artist.id : nil
end
