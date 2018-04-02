import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component {

  render() {
    const { currentUser, logout } = this.props;
    if (currentUser) {
      return (
        <div>
          <h1>Welcome, {currentUser}</h1>
          <button>Log Out</button>
        </div>
      )
    } else {
      return (
        <div>
          <h1>Why not sign up or log in :)</h1>
          <Link to='/login'>Log In</Link>
          <Link to='/signup'>Sign Up</Link>
        </div>
      )
    }
  }

}

export default Greeting;
