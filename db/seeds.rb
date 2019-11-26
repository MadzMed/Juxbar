require 'json'
require 'open-uri'

# USERS

m = User.create(email: "mehdilmbn@gmail.com", password: "juxbar", username: "MadzMed", barman: true)
p = User.create(email: "pierre@roger-roussel.com", password: "lenske", username: "Pierrot", barman: true)
s = User.create(email: "simon@kobayashi-design.com", password: "juxbar", username: "Kobayashi", barman: true)
f = User.create(email: "floriandbc@gmail.com", password: "juxbar", username: "floppy33300", barman: true)

# BARS

Bar.create(name: "Rockwood", address: "4 Quai Louis XVIII, 33000 Bordeaux", user_id: f.id)
Bar.create(name: "Molly Malone's", address: "83 Quai des Chartrons, 33300 Bordeaux", user_id: m.id)
Bar.create(name: "Mama Shelter", address: "19 Rue Poquelin Molière, 33000 Bordeaux", user_id: p.id)
Bar.create(name: "Cafe Brun", address: "45 Rue Saint-Rémi, 33000 Bordeaux", user_id: s.id)
Bar.create(name: "Le Wagon", address: "107 Cours Balguerie Stuttenberg, 33300 Bordeaux", user_id: m.id)

# SONGS

Session.create(bar_id: 5, description: "little describe")
Session.create(bar_id: 4, description: "little describe")
Session.create(bar_id: 3, description: "little describe")
url = 'https://api.deezer.com/artist/13/top?limit=5'
songs_serialized = open(url).read
songs = JSON.parse(songs_serialized)
p = Playlist.create(user_id: 1, started_at: Time.now, session_id: 1)
m = Playlist.create(user_id: 2, started_at: Time.now, session_id: 2)
d = Playlist.create(user_id: 3, started_at: Time.now, session_id: 3)
songs["data"].each do |song|
  s = Song.create(artist: song["artist"]["name"], album: song["album"]["title"], duration: song["duration"], title: song["title"], deezer_id: song["id"], playlist_id: p.id )
  s = Song.create(artist: song["artist"]["name"], album: song["album"]["title"], duration: song["duration"], title: song["title"], deezer_id: song["id"], playlist_id: m.id )
  s = Song.create(artist: song["artist"]["name"], album: song["album"]["title"], duration: song["duration"], title: song["title"], deezer_id: song["id"], playlist_id: d.id )
end

