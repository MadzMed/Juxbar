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
      // console.log(playlist)
      console.dir(playlist.children["1"])
      // console.dir(document.getElementById("myplaylist").children)
      if (document.getElementById("myplaylist").children.length === 2){
        myPlaylist.style.display = "";
        myPlaylist.insertAdjacentHTML("beforeend", playlist.innerHTML)
      } else if (playlist.children["0"].children["0"].classList["1"] === "fa-check") {
        myPlaylist.insertAdjacentHTML("beforeend", playlist.innerHTML)
      } else {


      }
   });
  });
}

export { createPlaylist };
