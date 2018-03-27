import React from 'react';
import { uniqueId } from '../../util/form_util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      id: null,
      done: false
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.titleChange = this.titleChange.bind(this);
    this.bodyChange = this.bodyChange.bind(this);
  }

  titleChange(event){
    let title = event.target.value;
    this.setState({title});
  }

  bodyChange(event){
    let body = event.target.value;
    this.setState({body});
  }

  handleSubmit(event) {
    event.preventDefault();
    this.state.id = uniqueId();
    let that = this.state;
    let current_id = this.state.id;
    this.props.receiveTodo({[that.id]:that});
  }


  render() {
    return (
      <form>
        <label>Title
          <input onChange={this.titleChange} type='text' value={this.state.title}></input>
        </label>
        <br/>
        <label>Body
          <textarea onChange={this.bodyChange} value={this.state.body}></textarea>
        </label>
        <button onClick={this.handleSubmit}>Submit</button>
      </form>
    );
  }
}

export default TodoForm;
