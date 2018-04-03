import { connect } from 'react-redux';
import Search from './search';
import { fetchBenches } from '../actions/bench_actions';


const mapStateToProps = (state) => {
  const emptyBenches = [];
  let benches;
  if (state.entities.benches) {
    benches = Object.keys(state.entities.benches).map((id) => state.entities.benches[id]);
    return { benches }
  } else {
    return { benches: [] }
  }
};

const mapDispatchToProps = (dispatch) => ({
  fetchBenches: () => dispatch(fetchBenches())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
