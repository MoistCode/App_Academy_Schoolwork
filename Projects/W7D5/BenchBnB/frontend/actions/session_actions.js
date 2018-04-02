import { postUser, postSession, deleteSession} from '../utils/session_api_util';


export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser,
});

const receiveErrors = (errors) => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const logout = () => dispatch => deleteSession()
  .then(() => dispatch(receiveCurrentUser(null)));


export const signup = (formUser) => dispatch => postUser(formUser)
  .then(user => dispatch(receiveCurrentUser(user)));


export const login = (formUser) => dispatch => postSession(formUser)
  .then(user => dispatch(receiveCurrentUser(user)));
