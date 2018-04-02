import { RECEIVE_CURRENT_USER } from '../action/session_actions';
import merge from 'lodash/merge';

const _defaultCurrentUser = Object.freeze({ currentUser: null });

const SessionReducer = (oldState = _defaultCurrentUser, action) => {
  Object.freeze(oldState);
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      return merge({}, { currentUser: action.currentUser });
    default:
      return oldState;
  }
};

export default SessionReducer;
