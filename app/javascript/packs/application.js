import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';
import { heartLike } from '../plugins/heart_animation'

initMapbox();
heartLike();

