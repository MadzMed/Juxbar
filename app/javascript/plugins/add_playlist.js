const createPlaylist = () => {
  let playlists = document.querySelectorAll(".children")
  // let playlists = document.getElementById("top-playlist").children
  // console.log(playlists)
  playlists.forEach ((playlist) => {
    playlist.addEventListener("click", (e) => {
      playlist.children["1"].children["0"].children["0"].classList.toggle("fa-plus");
      playlist.children["1"].children["0"].children["0"].classList.toggle("fa-check");
      // console.dir(playlists[i].children["1"].children["0"].children["0"].classList);
      let myPlaylist = document.getElementById("myplaylist");
      console.log(e.currentTarget)
      // console.log(playlist)
      // console.dir(playlist.children["1"])
      // console.dir(document.getElementById("myplaylist").children)
      console.dir(document.getElementById("first-card").children)
      if (document.getElementById("first-card").children.length === 0){
        myPlaylist.style.display = "";
        document.getElementById("first-card").insertAdjacentHTML("beforeend", `<div class="playlist-list-first d-flex justify-content-between children">${playlist.innerHTML}</div>`);
      } else if (playlist.children["1"].children["0"].children["0"].classList["1"] === "fa-check") {
        document.getElementById("first-card").insertAdjacentHTML("beforeend", `<div class="playlist-list d-flex justify-content-between children">${playlist.innerHTML}</div>`);
      } else if (playlist.children["1"].children["0"].children["0"].classList["1"] === "fa-check") {

      }
   });
  });
}

export { createPlaylist };
