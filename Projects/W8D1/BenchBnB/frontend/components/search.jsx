import BenchMap from './benches/bench_map';
import BenchIndex from './benches/bench_index';
import React from 'react';

const Search = ({ benches, fetchBenches }) => (
  <div>
    <BenchMap benches={ benches } fetchBenches={ fetchBenches } />
    <BenchIndex key={ benches.id } benches={ benches } fetchBenches={ fetchBenches }/>
  </div>
)

export default Search;
