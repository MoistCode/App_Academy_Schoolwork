import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: ''
    };
    console.log(this.props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.shownLink = this.shownLink.bind(this);
    this.errorMessages = this.errorMessages.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user)
  }

  handleChange(field) {
    return (e) => {
      this.setState({ [field]: e.target.value })
    }
  }

  shownLink() {
    if (this.props.formType === 'Log In') {
      return (
        <Link to='/signup'>Sign Up</Link>
      )
    } else {
      return (
        <Link to='/login'>Log In</Link>
      )
    }
  }

  errorMessages() {
    if (this.props.errors.session.length !== 0) {
      return (
        <ul>
          {
            this.props.errors.session.map((err) => <li>{err}</li>)
          }
        </ul>
      )
    }
  }

  render() {

    return (
      <div>
        <h1>{this.props.formType}</h1>
        {this.shownLink()}
        {this.errorMessages()}
        <form onSubmit={this.handleSubmit}>
          <label>Username:
            <input type='text'
                   value={this.state.username}
                   onChange={this.handleChange('username')} />
          </label>
          <label>Password:
            <input type='password'
                   value={this.state.password}
                   onChange={this.handleChange('password')} />
          </label>
          <button>{this.props.formType}!</button>
        </form>
      </div>
    )

  }

}

export default SessionForm;
