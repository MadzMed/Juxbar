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
j = User.create(email: "jojo@gmail.com", password: "juxbar", username: "Jonathan", barman: true, photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/jerclbbakoluf9xjpkrc.jpg")
f = User.create(email: "fred@gmail.com", password: "juxbar", username: "Fred", barman: true, photo: "https://images.unsplash.com/photo-1567631015346-4d8fce3fae81?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80")
n = User.create(email: "marie@gmail.com", password: "juxbar", username: "Marie", barman: true, photo: "https://images.unsplash.com/photo-1521898130196-7b90b77c704e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")
l = User.create(email: "laura@gmail.com", password: "juxbar", username: "Laura", barman: true, photo: "https://images.unsplash.com/photo-1555084415-b708df0fef3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=881&q=80")
b = User.create(email: "bertrand@gmail.com", password: "juxbar", username: "Bertrand", barman: true, photo: "https://avatars1.githubusercontent.com/u/9798952?v=4")
a = User.create(email: "TC@gmail.com", password: "juxbar", username: "Team Com", barman: false, photo: "https://images-na.ssl-images-amazon.com/images/I/61nlOq80N5L._SX355_.jpg")
t = User.create(email: "TA@gmail.com", password: "juxbar", username: "Team TA", barman: false, photo: "https://img.discogs.com/vgQzcX_w8Qu2bWsy78A0dSJNLSE=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-9194925-1476455418-6328.jpeg.jpg")
# BARS

Bar.create(name: "Rockwood", address: "4 Quai Louis XVIII, 33000 Bordeaux", user_id: j.id, description: "Le ROCKWOOD BAR CAFE est le spot parfait pour déguster de délicieux cocktails ou se désaltérer avec l’une de nos 8 bières pressions. Nous proposons également une large sélection de gin, rhum, whisky et spiritueux de qualité.", image: "http://www.rockwood.fr/images/rockwood-bordeaux-happy-hour.jpg")
Bar.create(name: "Molly Malone's", address: "83 Quai des Chartrons, 33300 Bordeaux", user_id: n.id, description: "Le Molly Malone’s, pub irlandais installé le long des quais des Chartrons depuis 2004, est une adresse incontournable à Bordeaux. Etudiants ou actifs, touristes ou Bordelais, supporters de foot ou amateurs de jazz... Tous se retrouvent dans ce lieu entièrement dédié à la culture irlandaise.", image: "https://www.pagesjaunes.fr/media/ugc/le_molly_malone_s_03306300_200959135")
Bar.create(name: "Mama Shelter", address: "19 Rue Poquelin Molière, 33000 Bordeaux", user_id: f.id, description: "Au cœur de la Gironde, à quelques encablures des plages de l’Atlantique, la cité de Bordeaux, capitale mondiale de l’œnologie, est une bonne vivante, attablée avec ses amis du monde entier.", image: "https://cms.mamashelter.com/bordeaux/wp-content/uploads/sites/2/2019/10/Mama-Bordeaux-Insta-2017_212_2.jpg")
Bar.create(name: "Cafe Brun", address: "45 Rue Saint-Rémi, 33000 Bordeaux", user_id: l.id, description: "Le Café Brun  vous accueille dans un décor d’antan, composé principalement d’objets et de meubles chinés. Une ambiance authentique et conviviale en plein coeur de la ville. La particularité du Café Brun ?", image: "https://ik.imagekit.io/youshould/Bar/prod/D15C0BAD-77E6-449C-85DC-8ABD22AA26C2/20170710080758343/1499675819.jpg")
Bar.create(name: "Empire", address: "14 Rue de la Devise, 33000 Bordeaux", user_id: j.id, description: "Aménagé dans un bâtiment ancien aux pierres apparentes, ce bar propose des vins et d'autres boissons.", image: "https://uploads.lebonbon.fr/source/2018/bdx/mai/Lempire630Bar.jpg")
Bar.create(name: "Iboat", address: "3 Cours Henri Brunet, 33300 Bordeaux", user_id: n.id, description: "Solidement ancré dans sa ville et dans son quartier, l’IBOAT se positionne comme un outil de diffusion atypique et indépendant. Porteur d’une politique culturelle curieuse et ambitieuse, l’équipage déploie ponctuellement son action en dehors des murs.", image: "https://medias.otbor.vm.aiprod.com/original/LOIAQU033V500OJ6/0-Entree-iboat-nuit-2.jpg")
Bar.create(name: "La Comtesse", address: "25 Rue du Parlement Saint-Pierre, 33000 Bordeaux", user_id: f.id, description: "Si vous êtes amatrice de mojito, la Comtesse est pour vous ! Pétillante, sucrée comme il faut et rehaussée par des framboises fraîches, la célèbre boisson de Cuba est la star du lieu. Mais avant d’y goûter, il vous faudra passer par la porte ornée de photos kitsch qui vous laissent pénétrer dans l’univers de la Comtesse fait de meubles chinés.", image: "https://live.staticflickr.com/3680/12040749784_53817ae920_b.jpg")
Bar.create(name: "Apollo", address: "19 Place Fernand Lafargue, 33000 Bordeaux", user_id: l.id, description: "L’apollo bar est situé au 19 place Fernand Laffargue, véritable place phare du centre ville, au cœur du quartier historique de Bordeaux. L’ effervescence de la place est réanimée, son agitation se retranscrit entre les murs de l’apollo.", image: "https://www.airbnb.com/google_place_photo?photoreference=CmRaAAAA42lWgq8qwZ82Vh4FnWf0OSABcWlhZKBY9dXYYk11c3o3IknFb35no7ASBZqCJZWs-4Havs6ukNmCsqO2P9OqhQ49ffrfaYdn0tAqWMLBtlQiB0q-Zy-waZ3Z3H5xb_xVEhCFIGLIcPMYoq3CCwhghLciGhRPsJim5pk9FvBo73eaETzWRT7KAg&maxwidth=1000&maxheight=1000&place_id=144098")
Bar.create(name: "Le Wagon", address: "107 cours balguerie stuttenberg, 33300 Bordeaux", user_id: b.id, description: "Merci à tous pour ces 9 semaines de bonheur, d'entraide, de rires, et parfois de larmes. Merci à toute l'équipe du Wagon pour ces rencontres, pour ces découvertes, pour ces maux de têtes... La team JUXBAR vous envoie un maximum de love.", image: "https://66.media.tumblr.com/234d7407420ca666ad44a904f28f550b/c04780e1842a8f87-25/s1280x1920/471e830876b2815808a0c2ac3744fc7ea0626f49.jpg")

# SONGS

Session.create(bar_id: 5, description: "Ce soir session JUXBAR: 2h", category: "Année 80")
Session.create(bar_id: 4, description: "Ce soir session JUXBAR: 1h", category: "rap")
Session.create(bar_id: 3, description: "Ce soir session JUXBAR: 3h", category: "RnB")
Session.create(bar_id: 2, description: "Ce soir session JUXBAR: 1h", category: "Rock")
Session.create(bar_id: 6, description: "Ce soir session JUXBAR: 3h", category: "Electro")
Session.create(bar_id: 7, description: "Ce soir session JUXBAR: 1h", category: "Année 80")
Session.create(bar_id: 8, description: "Ce soir session JUXBAR: 2h", category: "Année 80")
Session.create(bar_id: 1, description: "Ce soir session JUXBAR: 1h", category: "Latino")
Session.create(bar_id: 9, description: "Ce soir session JUXBAR: All night long!!!", category: "Année 80")


p = Playlist.create(user_id: 6, started_at: Time.now, session_id: 1)
m = Playlist.create(user_id: 7, started_at: Time.now, session_id: 2)
d = Playlist.create(user_id: 8, started_at: Time.now, session_id: 3)
f = Playlist.create(user_id: 6, started_at: Time.now, session_id: 4)
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
