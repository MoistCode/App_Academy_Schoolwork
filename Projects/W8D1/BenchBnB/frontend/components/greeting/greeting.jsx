import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component {
  constructor(props) {
    super(props);
    this.logoutUser = this.logoutUser.bind(this);
  }

  logoutUser() {
    this.props.logout();
  }

  render() {
    const { currentUser } = this.props;
    if (currentUser) {
      return (
        <div>
          <h1>Welcome, {currentUser.username}</h1>
          <button onClick={this.logoutUser}>Log Out</button>
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
