import {
  RECEIVE_SESSION_ERRORS,
  RECEIVE_CURRENT_USER
} from '../actions/session_actions';
import merge from 'lodash/merge';

const _uniqueItUp = (arr) => {
  let newArr = [];
  for(let i = 0; i < arr.length; i++) {
    let unique = true;
    for(let j = (i + 1); j < arr.length; j++) {
      if (arr[i] === arr[j]) {
        unique = false;
      }
    }
    if (unique) {
      newArr.push(arr[i]);
    }
  }
  return newArr;
};

const sessionErrorsReducer = (oldState = [], action) => {
  Object.freeze(oldState);
  switch(action.type) {
    case RECEIVE_SESSION_ERRORS:
      const newState = oldState.concat(action.errors);
      return _uniqueItUp(newState);
    case RECEIVE_CURRENT_USER:
      return [];
    default:
      return oldState;
  }
};

export default sessionErrorsReducer;
