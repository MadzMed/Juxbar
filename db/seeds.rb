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

url = 'https://api.deezer.com/artist/13/top?limit=5'
songs = open(url).read
song = JSON.parse(songs)
p song

