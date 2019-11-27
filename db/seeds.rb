require 'json'
require 'open-uri'

# USERS

m = User.create(email: "mehdilmbn@gmail.com", password: "juxbar", username: "MadzMed", barman: true, photo: "https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/s960x960/47689225_10218747533618335_6207042897448009728_o.jpg?_nc_cat=109&_nc_ohc=FoQmIqCNeWMAQlSbe-2QlhWxL1vfCFVZgtr_-pgOUQQYVOlL5zz712xBw&_nc_ht=scontent-cdg2-1.xx&oh=8f14f8adb4b971a8348536fab2536273&oe=5E7F51FA")
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

Session.create(bar_id: 5, description: "little describe", category: "pop")
Session.create(bar_id: 4, description: "little describe", category: "pop")
Session.create(bar_id: 3, description: "little describe", category: "pop")
Session.create(bar_id: 2, description: "little describe", category: "pop")
p = Playlist.create(user_id: 1, started_at: Time.now, session_id: 1)
m = Playlist.create(user_id: 2, started_at: Time.now, session_id: 2)
d = Playlist.create(user_id: 3, started_at: Time.now, session_id: 3)
f = Playlist.create(user_id: 4, started_at: Time.now, session_id: 4)
url = 'https://api.deezer.com/chart/?limit=5'
songs_serialized = open(url).read
songs = JSON.parse(songs_serialized)
songs["tracks"]["data"].each do |song|
  s = Song.create(artist: song["artist"]["name"], album: song["album"]["title"], photo_artist: song["artist"]["picture_small"], photo_album: song["album"]["cover_small"], duration: song["duration"], title: song["title"], deezer_id: song["id"], playlist_id: p.id )
end

url = 'https://api.deezer.com/chart/?index=6&limit=5'
songs_serialized = open(url).read
songs = JSON.parse(songs_serialized)
songs["tracks"]["data"].each do |song|
  s = Song.create(artist: song["artist"]["name"], album: song["album"]["title"], photo_artist: song["artist"]["picture_small"], photo_album: song["album"]["cover_small"], duration: song["duration"], title: song["title"], deezer_id: song["id"], playlist_id: m.id )
end

url = 'https://api.deezer.com/chart/?index=12&limit=5'
songs_serialized = open(url).read
songs = JSON.parse(songs_serialized)
songs["tracks"]["data"].each do |song|
  s = Song.create(artist: song["artist"]["name"], album: song["album"]["title"], photo_artist: song["artist"]["picture_small"], photo_album: song["album"]["cover_small"], duration: song["duration"], title: song["title"], deezer_id: song["id"], playlist_id: d.id )
end

url = 'https://api.deezer.com/chart/?index=18&limit=5'
songs_serialized = open(url).read
songs = JSON.parse(songs_serialized)
songs["tracks"]["data"].each do |song|
  s = Song.create(artist: song["artist"]["name"], album: song["album"]["title"], photo_artist: song["artist"]["picture_small"], photo_album: song["album"]["cover_small"], duration: song["duration"], title: song["title"], deezer_id: song["id"], playlist_id: f.id )
end

