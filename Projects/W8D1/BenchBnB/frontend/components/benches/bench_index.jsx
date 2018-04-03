import React from 'react';

class BenchIndex extends React.Component {

  componentDidMount() {
    this.props.fetchBenches();
  }

  render() {

    if (this.props.benches.length == 0) {
      return (
        <div>
          <br />
          Loading...
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
