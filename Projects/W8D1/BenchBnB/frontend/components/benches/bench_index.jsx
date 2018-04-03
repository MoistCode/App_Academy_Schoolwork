import React from 'react';

class BenchIndex extends React.Component {

  componentDidMount() {
    this.props.fetchBenches();
  }

  render() {

    if (this.props.benches.length == 0) {
      return (
        <div class="sk-circle">
          <div class="sk-circle1 sk-child"></div>
          <div class="sk-circle2 sk-child"></div>
          <div class="sk-circle3 sk-child"></div>
          <div class="sk-circle4 sk-child"></div>
          <div class="sk-circle5 sk-child"></div>
          <div class="sk-circle6 sk-child"></div>
          <div class="sk-circle7 sk-child"></div>
          <div class="sk-circle8 sk-child"></div>
          <div class="sk-circle9 sk-child"></div>
          <div class="sk-circle10 sk-child"></div>
          <div class="sk-circle11 sk-child"></div>
          <div class="sk-circle12 sk-child"></div>
        </div>

      )
    }

    return (
      <div>
        <h2>Muh Benches</h2>
        <ul>
          {this.props.benches.map((bench) => (
            <div key={bench.id}>
              <li><strong>Description:</strong> {bench.description}</li>
              <li><strong>Longitude:</strong> {bench.longitude}</li>
              <li><strong>Latitude:</strong> {bench.latitude}</li>
              <br />
            </div>
          ))}
        </ul>
      </div>
    )
  }
}

export default BenchIndex;
