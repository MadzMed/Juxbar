const createPlaylist = () => {
  let playlists = document.querySelectorAll(".children")
  playlists.forEach ((playlist) => {
    playlist.addEventListener("click", (e) => {
      playlist.children["1"].children["0"].children["0"].classList.toggle("fa-plus");
      playlist.children["1"].children["0"].children["0"].classList.toggle("fa-check");
      let newPlaylist = document.getElementById("first-card");
      let myPlaylist = document.getElementById("myplaylist");
      if (newPlaylist.children.length < 5 ) {
        if (newPlaylist.children.length === 0){
          myPlaylist.style.display = "";
          newPlaylist.insertAdjacentHTML("beforeend", `<div class="playlist-list-first d-flex justify-content-between children">${playlist.innerHTML}</div>`);
          playlist.setAttribute('style', 'display:none !important');
        } else if (playlist.children["1"].children["0"].children["0"].classList["2"] === "fa-check") {
          newPlaylist.insertAdjacentHTML("beforeend", `<div class="playlist-list d-flex justify-content-between children">${playlist.innerHTML}</div>`);
          playlist.setAttribute('style', 'display:none !important');
        }
      } else {
        alert("impossible de rajouter des sons")
      }
      newPlaylist.querySelectorAll(".children").forEach((playlist) => {
        if (newPlaylist.children.length === 1){
          playlist.addEventListener("click", (e) => {
            playlist.remove();
            myPlaylist.style.display = "none";
          });
        } else if (newPlaylist.children.length > 0){
          playlist.addEventListener("click", (e) => {
            playlist.remove();
          });
        }
      });
   });
  });
}

const destroySong = () => {
  let songDestroy = document.querySelectorAll(".children-destroy");
  let topPlaylist = document.getElementById("top-playlist");
  songDestroy.forEach ((song) => {
    song.addEventListener("click", (e) => {
      song.setAttribute('style', 'display:none !important');
      topPlaylist.insertAdjacentHTML("beforeend", `<div class="playlist-list d-flex justify-content-between children">${song.innerHTML}</div>`);
    });
  })
}


export { createPlaylist };
export { destroySong };
