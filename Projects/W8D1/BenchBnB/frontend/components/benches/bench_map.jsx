import React from 'react';
import MarkerManager from '../../util/marker_manager';

class BenchMap extends React.Component {

  componentDidMount() {
    this.props.fetchBenches();
    const mapOptions = {
      center: { lat: 0, lng: 0 },
      zoom: 1
    };

    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers();
  }

  componentWillReceiveProps(nextProps) {
    this.MarkerManager.updateMarkers();
    if (this.props.benches.length != 0) {
      this.props.benches.forEach((bench) => {
        this.MarkerManager.createMarkerFromBench(bench, this.map);
      });
    }
  }

  render() {
    return (
      <div id='map-container' ref={ map => this.mapNode = map }>
      </div>
    )
  }
}

export default BenchMap;
