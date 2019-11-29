const song = () => {
  if (document.getElementById("top-playlist")) {
    const playlists = document.getElementById("top-playlist").children
    for (let i=0; i<playlists.length - 1; i+=1) {
      playlists[i].addEventListener("click", (e) => {
        playlists[i].children["1"].children["0"].children["0"].classList.toggle("fa-plus");
        playlists[i].children["1"].children["0"].children["0"].classList.toggle("fa-check");
        console.dir(playlists[i].children["1"].children["0"].children["0"].classList);

        const myPlaylist = document.getElementById("myplaylist");
        console.log(myPlaylist)
        console.dir(document.getElementById("first-card"));
        if (document.getElementById("first-card").children.length === 0){
          myPlaylist.style.display = "";
          myPlaylist.insertAdjacentHTML("beforeend", "<div class='playlist-list-first d-flex justify-content-between' data-song-title='<%= song['title'] %>' data-song-artist='<%= song['artist']['name'] %>' data-song-album='<%= song['album']['title'] %>' data-song-duration='<%= song['duration'] %>' data-song-deezer-id='<%= song['id'] %>' data-song-photo-album='<%= song['album']['cover_small'] %>' data-song-photo-album='<%= song['artist']['picture_small'] %>' data-remote='true' ><div class='d-flex text-left'> \
              <span class='mr-3 mt-3'><%= i %> •</span><%= image_tag song['album']['cover_small'], alt: 'alttext' %> \
              <span class='ml-3'><h5><%= song['artist']['name'] %></h5> \
              <p><%= song['title'] %></p></span></div> \
              <div class='d-flex flex-column'><span class='text-center'><i class='fas fa-plus'></i></span></div>")
        }else if (playlists[i].children["1"].children["0"].children["0"].classList["1"] === "fa-check") {
          myPlaylist.insertAdjacentHTML("beforeend", "<div class='playlist-list d-flex justify-content-between' data-song-title='<%= song['title'] %>' data-song-artist='<%= song['artist']['name'] %>' data-song-album='<%= song['album']['title'] %>' data-song-duration='<%= song['duration'] %>' data-song-deezer-id='<%= song['id'] %>' data-song-photo-album='<%= song['album']['cover_small'] %>' data-song-photo-album='<%= song['artist']['picture_small'] %>' data-remote='true' ><div class='d-flex text-left'> \
              <span class='mr-3 mt-3'><%= i %> •</span><%= image_tag song['album']['cover_small'], alt: 'alttext' %> \
              <span class='ml-3'><h5><%= song['artist']['name'] %></h5> \
              <p><%= song['title'] %></p></span></div> \
              <div class='d-flex flex-column'><span class='text-center'><i class='fas fa-plus'></i></span></div>")
        } else {


        }
     });
    };
  }
}

export { song };
