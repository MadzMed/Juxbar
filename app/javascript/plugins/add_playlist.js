const createPlaylist = () => {
  let playlists = document.querySelectorAll(".children")
  // let playlists = document.getElementById("top-playlist").children
  // console.log(playlists)
  playlists.forEach ((playlist) => {
    playlist.addEventListener("click", (e) => {
      playlist.children["1"].children["0"].children["0"].classList.toggle("fa-plus");
      playlist.children["1"].children["0"].children["0"].classList.toggle("fa-check");
      // console.dir(playlists[i].children["1"].children["0"].children["0"].classList);
      let newPlaylist = document.getElementById("first-card")
      let myPlaylist = document.getElementById("myplaylist");
      console.log(e.currentTarget)
      // console.log(playlist)
      // console.dir(playlist.children["1"])
      // console.dir(document.getElementById("myplaylist").children)
      console.dir(newPlaylist.children)
      if (newPlaylist.children.length < 5 ) {
        if (newPlaylist.children.length === 0){
          myPlaylist.style.display = "";
          newPlaylist.insertAdjacentHTML("beforeend", `<div class="playlist-list-first d-flex justify-content-between children">${playlist.innerHTML}</div>`);
          playlist.setAttribute('style', 'display:none !important')
        } else if (playlist.children["1"].children["0"].children["0"].classList["1"] === "fa-check") {
          newPlaylist.insertAdjacentHTML("beforeend", `<div class="playlist-list d-flex justify-content-between children">${playlist.innerHTML}</div>`);
          playlist.setAttribute('style', 'display:none !important')
        // } else if (playlist.children["1"].children["0"].children["0"].classList["1"] === "fa-check") {
        }
      } else {
        alert("trop de son maggle")
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

export { createPlaylist };
