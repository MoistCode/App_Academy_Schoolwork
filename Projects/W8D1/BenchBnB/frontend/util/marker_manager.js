import merge from 'lodash/merge';

export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = [];
  }

  markers() {
    this.markers;
  }

  updateMarkers(benches) {
    console.log('time to update');
  }

  createMarkerFromBench(bench, map) {
    this.markers.push(
      new google.maps.Marker({
        position: {lat: bench.latitude, lng: bench.longitude},
        map: map,
        title: bench.description
      })
    )
  }
}
