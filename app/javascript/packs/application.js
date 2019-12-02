import "bootstrap";

// import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';
import { heartLike } from '../plugins/heart_animation';
import { playerAdvance } from '../plugins/player_wave';
import { song } from '../plugins/add_playlist';
import { home, pushEnter } from '../plugins/home';


initMapbox();
heartLike();
playerAdvance();
song();
home();
pushEnter();


