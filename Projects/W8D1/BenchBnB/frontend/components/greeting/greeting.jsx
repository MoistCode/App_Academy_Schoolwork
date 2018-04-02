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

  loggedOutGreeting() {
    return (
      <div>
        <h1>Welcome, {this.props.currentUser.username}</h1>
        <button onClick={this.logoutUser}>Log Out</button>
      </div>
    )
  }

  loggedInGreeting() {
    return (
      <div>
        <h1>Why not sign up or log in :)</h1>
        <Link to='/login'>Log In</Link>
        <Link to='/signup'>Sign Up</Link>
      </div>
    )
  }

  render() {
    if (this.props.currentUser) {
      return this.loggedOutGreeting();
    } else {
      return this.loggedInGreeting();
    }
  }

}

export default Greeting;
