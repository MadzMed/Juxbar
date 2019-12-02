import "bootstrap";

// import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';
import { heartLike } from '../plugins/heart_animation';
import { playerAdvance } from '../plugins/player_wave';
import { song } from '../plugins/add_playlist';
import { anim } from '../plugins/burger_animation_slider';


initMapbox();
heartLike();
playerAdvance();
song();
anim();

