require 'json'
require 'open-uri'

# USERS

m = User.create(email: "mehdilmbn@gmail.com", password: "juxbar", username: "MadzMed", barman: true, photo: "https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/s960x960/47689225_10218747533618335_6207042897448009728_o.jpg?_nc_cat=109&_nc_ohc=FoQmIqCNeWMAQlSbe-2QlhWxL1vfCFVZgtr_-pgOUQQYVOlL5zz712xBw&_nc_ht=scontent-cdg2-1.xx&oh=8f14f8adb4b971a8348536fab2536273&oe=5E7F51FA")
p = User.create(email: "pierre@roger-roussel.com", password: "lenske", username: "Pierrot", barman: true)
s = User.create(email: "simon@kobayashi-design.com", password: "juxbar", username: "Kobayashi", barman: true)
f = User.create(email: "floriandbc@gmail.com", password: "juxbar", username: "floppy33300", barman: true)

# BARS

Bar.create(name: "Rockwood", address: "4 Quai Louis XVIII, 33000 Bordeaux", user_id: f.id, description: "Le Rockwood, sur les quais de Bordeaux, est le spot parfait pour déguster cocktails, bières pressions et spiritueux dans une ambiance playground.", image: "https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/s960x960/69575889_2545000822452961_468273154637168640_o.jpg?_nc_cat=111&_nc_ohc=Klrwj8COs9kAQm0Dq-N1DHJTVrA-9ZHldYj90PM2IOdyLzDgN0PjeauAg&_nc_ht=scontent-cdg2-1.xx&oh=63ac2a283f9834dd34cdf2dcdf1de82e&oe=5E8407F8")
Bar.create(name: "Molly Malone's", address: "83 Quai des Chartrons, 33300 Bordeaux", user_id: m.id, description: "Ce vaste pub au look irlandais sert des fish & chips dans une ambiance sports. Soirées et concerts organisés.", image: "https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwi2xpDmxormAhUBzYUKHRhBD9gQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.tripadvisor.fr%2FLocationPhotoDirectLink-g187079-d1329326-i137356848-Molly_Malone_s-Bordeaux_Gironde_Nouvelle_Aquitaine.html&psig=AOvVaw2o229PXPyVDFqTi-NiHgAo&ust=1574949632696780")
Bar.create(name: "Mama Shelter", address: "19 Rue Poquelin Molière, 33000 Bordeaux", user_id: p.id, description: "Plus que des chambres ou des restaurants, Mama Shelter est un lieu de vie et de rencontres, un véritable refuge urbain à la fois beau, moderne et plein d’esprit mais aussi, populaire, chaleureux et sexy. Installez-vous dans nos canapés pour déguster nos plats à partager, buvez un verre et détendez-vous, dormez sur vos deux oreilles… Mama s’occupe de tout !", image: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwi7vvX8xormAhURVhoKHbaQD9MQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.bordeaux-tourisme.com%2Foffre%2Ffiche%2Fmama-shelter-restaurant%2FRESAQU033FS001K6&psig=AOvVaw1YPIDRDPkvBcXwTPoiHSBc&ust=1574949691701168")
Bar.create(name: "Cafe Brun", address: "45 Rue Saint-Rémi, 33000 Bordeaux", user_id: s.id, description: "Décoré d'objets et de meubles chinés, ce bar propose une variété de whiskies et organise des apéros-concerts.", image: "https://ik.imagekit.io/youshould/tr:w-700,rt-auto/Bar/prod/D15C0BAD-77E6-449C-85DC-8ABD22AA26C2/20170710080759591/1499675820.jpg")
Bar.create(name: "Le Wagon", address: "107 Cours Balguerie Stuttenberg, 33300 Bordeaux", user_id: m.id, description: "accueillant et chaleureux, ce bar atypique vous propose des cours de code autour d'une bière.", image: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwii3Kntx4rmAhWNHhQKHZRSD7YQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.abcsalles.com%2Flieu%2Fle-wagon-bordeaux&psig=AOvVaw1X1WwT_PHZ093vb2SHcgYU&ust=1574949929556163")

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

