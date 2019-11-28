import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';
import { heartLike } from '../plugins/heart_animation'


initMapbox();
heartLike();



const song = () => {
  const playlists = document.getElementById("top-playlist").children
  for (let i=0; i<playlists.length - 1; i+=1) {
    playlists[i].addEventListener("click", (e) => {
      playlists[i].children["1"].children["0"].children["0"].classList.toggle("fa-plus");
      playlists[i].children["1"].children["0"].children["0"].classList.toggle("fa-check");
      console.dir(playlists[i].children["1"].children["0"].children["0"].classList);

      const myPlaylist = document.getElementById("myplaylist");
      console.log(myPlaylist)
      console.dir(document.getElementById("first-card"));
      if (document.getElementById("first-card") === null){
        myPlaylist.style.display = "";
        myPlaylist.insertAdjacentHTML("beforeend", "<div class='playlist container-playlist-card' style='z-index: 2; id='first-card'>patate</div>")
      }else if (playlists[i].children["1"].children["0"].children["0"].classList["1"] === "fa-check") {
        myPlaylist.insertAdjacentHTML("beforeend", "<div class='playlist container-playlist-card' style='z-index: 2;' id='first-card'>patate</div>")
      } else {

      }
    });
  };
}

song();

