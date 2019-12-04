require 'json'
require 'open-uri'

# Init
p "seed begin"
User.destroy_all
Bar.destroy_all
Session.destroy_all
Playlist.destroy_all
Song.destroy_all
# USERS

m = User.create(email: "mehdilmbn@gmail.com", password: "juxbar", username: "MadzMed", barman: true, photo: "https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/s960x960/47689225_10218747533618335_6207042897448009728_o.jpg?_nc_cat=109&_nc_ohc=FoQmIqCNeWMAQlSbe-2QlhWxL1vfCFVZgtr_-pgOUQQYVOlL5zz712xBw&_nc_ht=scontent-cdg2-1.xx&oh=8f14f8adb4b971a8348536fab2536273&oe=5E7F51FA")
p = User.create(email: "pierre@roger-roussel.com", password: "lenske", username: "Pierrot", barman: true, photo: "https://avatars2.githubusercontent.com/u/53620769?v=4")
s = User.create(email: "simon@kobayashi-design.com", password: "juxbar", username: "Kobayashi", barman: true, photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/oqs0hc1ilrkfkxynyr3f.jpg")
f = User.create(email: "floriandbc@gmail.com", password: "juxbar", username: "Floppy33300", barman: true, photo: "https://scontent-cdg2-1.xx.fbcdn.net/v/t31.0-8/218411_10151075233271748_516852219_o.jpg?_nc_cat=107&_nc_ohc=8OJ-IwyMH1AAQnYWfcKS0rMeqxbwgpTp2yEiYo4bp2xn1KzPCZQqLGRHA&_nc_ht=scontent-cdg2-1.xx&oh=d9e023d1fcefa7b8c4661345be7dfcf5&oe=5E45C768")
j = User.create(email: "jojo@gmail.com", password: "juxbar", username: "Jonathan", barman: true, photo: "https://images.unsplash.com/photo-1536935663840-b318537c89bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80")
f = User.create(email: "fred@gmail.com", password: "juxbar", username: "Fred", barman: true, photo: "https://images.unsplash.com/photo-1567631015346-4d8fce3fae81?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80")
m = User.create(email: "marie@gmail.com", password: "juxbar", username: "Marie", barman: true, photo: "https://images.unsplash.com/photo-1521898130196-7b90b77c704e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")
l = User.create(email: "laura@gmail.com", password: "juxbar", username: "Laura", barman: true, photo: "https://images.unsplash.com/photo-1555084415-b708df0fef3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=881&q=80")
b = User.create(email: "bob@gmail.com", password: "juxbar", username: "Bob", barman: false, photo: "https://images.unsplash.com/photo-1533227268428-f9ed0900fb3b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1479&q=80")
a = User.create(email: "anna@gmail.com", password: "juxbar", username: "Anna", barman: false, photo: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")
t = User.create(email: "thomas@gmail.com", password: "juxbar", username: "Thomas", barman: false, photo: "https://images.unsplash.com/photo-1505503693641-1926193e8d57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2667&q=80")
# BARS

Bar.create(name: "Rockwood", address: "4 Quai Louis XVIII, 33000 Bordeaux", user_id: f.id, description: "Le ROCKWOOD BAR CAFE est le spot parfait pour déguster de délicieux cocktails ou se désaltérer avec l’une de nos 8 bières pressions. Nous proposons également une large sélection de gin, rhum, whisky et spiritueux de qualité.", image: "https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/s960x960/69575889_2545000822452961_468273154637168640_o.jpg?_nc_cat=111&_nc_ohc=Klrwj8COs9kAQm0Dq-N1DHJTVrA-9ZHldYj90PM2IOdyLzDgN0PjeauAg&_nc_ht=scontent-cdg2-1.xx&oh=63ac2a283f9834dd34cdf2dcdf1de82e&oe=5E8407F8")
Bar.create(name: "Molly Malone's", address: "83 Quai des Chartrons, 33300 Bordeaux", user_id: m.id, description: "Le Molly Malone’s, pub irlandais installé le long des quais des Chartrons depuis 2004, est une adresse incontournable à Bordeaux. Etudiants ou actifs, touristes ou Bordelais, supporters de foot ou amateurs de jazz... Tous se retrouvent dans ce lieu entièrement dédié à la culture irlandaise.", image: "https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwi2xpDmxormAhUBzYUKHRhBD9gQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.tripadvisor.fr%2FLocationPhotoDirectLink-g187079-d1329326-i137356848-Molly_Malone_s-Bordeaux_Gironde_Nouvelle_Aquitaine.html&psig=AOvVaw2o229PXPyVDFqTi-NiHgAo&ust=1574949632696780")
Bar.create(name: "Mama Shelter", address: "19 Rue Poquelin Molière, 33000 Bordeaux", user_id: p.id, description: "Au cœur de la Gironde, à quelques encablures des plages de l’Atlantique, la cité de Bordeaux, capitale mondiale de l’œnologie, est une bonne vivante, attablée avec ses amis du monde entier.", image: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwi7vvX8xormAhURVhoKHbaQD9MQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.bordeaux-tourisme.com%2Foffre%2Ffiche%2Fmama-shelter-restaurant%2FRESAQU033FS001K6&psig=AOvVaw1YPIDRDPkvBcXwTPoiHSBc&ust=1574949691701168")
Bar.create(name: "Cafe Brun", address: "45 Rue Saint-Rémi, 33000 Bordeaux", user_id: s.id, description: "Le Café Brun  vous accueille dans un décor d’antan, composé principalement d’objets et de meubles chinés. Une ambiance authentique et conviviale en plein coeur de la ville. La particularité du Café Brun ?", image: "https://ik.imagekit.io/youshould/tr:w-700,rt-auto/Bar/prod/D15C0BAD-77E6-449C-85DC-8ABD22AA26C2/20170710080759591/1499675820.jpg")
Bar.create(name: "L’Empire", address: "14 Rue de la Devise, 33000 Bordeaux", user_id: m.id, description: "Aménagé dans un bâtiment ancien aux pierres apparentes, ce bar propose des vins et d'autres boissons.", image: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwii3Kntx4rmAhWNHhQKHZRSD7YQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.abcsalles.com%2Flieu%2Fle-wagon-bordeaux&psig=AOvVaw1X1WwT_PHZ093vb2SHcgYU&ust=1574949929556163")
Bar.create(name: "L’Iboat", address: "3 Cours Henri Brunet, 33300 Bordeaux", user_id: f.id, description: "Solidement ancré dans sa ville et dans son quartier, l’IBOAT se positionne comme un outil de diffusion atypique et indépendant. Porteur d’une politique culturelle curieuse et ambitieuse, l’équipage déploie ponctuellement son action en dehors des murs.", image: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwii3Kntx4rmAhWNHhQKHZRSD7YQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.abcsalles.com%2Flieu%2Fle-wagon-bordeaux&psig=AOvVaw1X1WwT_PHZ093vb2SHcgYU&ust=1574949929556163")
Bar.create(name: "La Comtesse", address: "25 Rue du Parlement Saint-Pierre, 33000 Bordeaux", user_id: p.id, description: "Si vous êtes amatrice de mojito, la Comtesse est pour vous ! Pétillante, sucrée comme il faut et rehaussée par des framboises fraîches, la célèbre boisson de Cuba est la star du lieu. Mais avant d’y goûter, il vous faudra passer par la porte ornée de photos kitsch qui vous laissent pénétrer dans l’univers de la Comtesse fait de meubles chinés.", image: "https://images.unsplash.com/photo-1539639885136-56332d18071d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")
Bar.create(name: "L’Apollo", address: "19 Place Fernand Lafargue, 33000 Bordeaux", user_id: s.id, description: "L’apollo bar est situé au 19 place Fernand Laffargue, véritable place phare du centre ville, au cœur du quartier historique de Bordeaux. L’ effervescence de la place est réanimée, son agitation se retranscrit entre les murs de l’apollo.", image: "https://images.unsplash.com/photo-1491333078588-55b6733c7de6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80")
# SONGS

Session.create(bar_id: 5, description: "Ce soir session JUXBAR: 2h", category: "pop")
Session.create(bar_id: 4, description: "Ce soir session JUXBAR: 1h", category: "rap")
Session.create(bar_id: 3, description: "Ce soir session JUXBAR: 3h", category: "RnB")
Session.create(bar_id: 2, description: "Ce soir session JUXBAR: 1h", category: "Rock")
Session.create(bar_id: 6, description: "Ce soir session JUXBAR: 3h", category: "Electro")
Session.create(bar_id: 7, description: "Ce soir session JUXBAR: 1h", category: "Jazz")
Session.create(bar_id: 8, description: "Ce soir session JUXBAR: 2h", category: "Année 80")
Session.create(bar_id: 1, description: "Ce soir session JUXBAR: 1h", category: "Latino")
p = Playlist.create(user_id: 1, started_at: Time.now, session_id: 1)
m = Playlist.create(user_id: 2, started_at: Time.now, session_id: 2)
d = Playlist.create(user_id: 3, started_at: Time.now, session_id: 3)
f = Playlist.create(user_id: 4, started_at: Time.now, session_id: 4)
url = 'https://api.deezer.com/chart/?limit=5'
songs_serialized = open(url).read
songs = JSON.parse(songs_serialized)
songs["tracks"]["data"].each do |song|
  s = Song.create(artist: song["artist"]["name"], album: song["album"]["title"], photo_artist: song["artist"]["picture_small"], photo_album: song["album"]["cover_small"], duration: song["duration"], title: song["title"], deezer_id: song["id"], playlist_id: p.id, photo_large: song["album"]["cover_big"], preview: song["preview"] )
end

url = 'https://api.deezer.com/chart/?index=6&limit=5'
songs_serialized = open(url).read
songs = JSON.parse(songs_serialized)
songs["tracks"]["data"].each do |song|
  s = Song.create(artist: song["artist"]["name"], album: song["album"]["title"], photo_artist: song["artist"]["picture_small"], photo_album: song["album"]["cover_small"], duration: song["duration"], title: song["title"], deezer_id: song["id"], playlist_id: m.id, photo_large: song["album"]["cover_big"], preview: song["preview"] )
end

url = 'https://api.deezer.com/chart/?index=12&limit=5'
songs_serialized = open(url).read
songs = JSON.parse(songs_serialized)
songs["tracks"]["data"].each do |song|
  s = Song.create(artist: song["artist"]["name"], album: song["album"]["title"], photo_artist: song["artist"]["picture_small"], photo_album: song["album"]["cover_small"], duration: song["duration"], title: song["title"], deezer_id: song["id"], playlist_id: d.id, photo_large: song["album"]["cover_big"], preview: song["preview"] )
end

url = 'https://api.deezer.com/chart/?index=18&limit=5'
songs_serialized = open(url).read
songs = JSON.parse(songs_serialized)
songs["tracks"]["data"].each do |song|
  s = Song.create(artist: song["artist"]["name"], album: song["album"]["title"], photo_artist: song["artist"]["picture_small"], photo_album: song["album"]["cover_small"], duration: song["duration"], title: song["title"], deezer_id: song["id"], playlist_id: f.id, photo_large: song["album"]["cover_big"], preview: song["preview"] )
end

p "seed completed"
