json.names @names do |name|
  json.id       "testid"    #name.NameID
  json.first    "testfirst" #name.NameFirstName
  json.last     "testlast"  #name.NameLastName

  json.artist_id album.artist ? album.artist.id : nil
end
