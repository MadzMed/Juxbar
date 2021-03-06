import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: "mapbox://styles/pierrot160/ck3t1bpjs0iy01cpap2tlt9hz",
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 100, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    map.boxZoom.disable();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);

      map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },

      trackUserLocation: true,
      }));
    };
  };


export { initMapbox };
