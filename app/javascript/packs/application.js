import "bootstrap";

// import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';
import { heartLike } from '../plugins/heart_animation';
import { playerAdvance } from '../plugins/player_wave';
import { createPlaylist, destroySong } from '../plugins/add_playlist';
import { song } from '../plugins/add_playlist';
import { anim } from '../plugins/burger_animation_slider';
import { home, pushEnter } from '../plugins/home';

initMapbox();
heartLike();
playerAdvance();
if (document.getElementById("top-playlist")) {
  createPlaylist();
}

if (document.querySelectorAll(".children-destroy")) {
  destroySong();
}
if (document.querySelector('#box')) {
  anim();
}

if (document.getElementById("btn-home")) {
  home();
  pushEnter();
}
