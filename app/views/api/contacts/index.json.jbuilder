json.contacts @contacts do |contact|
  json.id       "testid"    #contact.NameID
  json.first    "testfirst" #contact.NameFirstName
  json.last     "testlast"  #contact.NameLastName

  json.artist_id album.artist ? album.artist.id : nil
end
