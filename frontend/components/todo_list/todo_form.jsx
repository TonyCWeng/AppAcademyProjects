import React from 'react';
import uniqueId from '../../util/unique_id.jsx';

class TodoForm extends React.Component{
  constructor (props) {
    super(props);
    this.blankState = { title: "", body: "", done: false};
    this.state = { title: "", body: "", done: false};
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, {id: uniqueId()});
    this.props.receiveTodo(todo);
    this.setState(this.blankState);
  }

  updateTitle(e) { (
    this.setState({ title: e.target.value})
    );
  }

  updateBody(e) { (
    this.setState({ body: e.target.value})
    );
  }

  render () {
    return (
      <form onSubmit={this.handleSubmit}>
        <input onChange={this.updateTitle}
          type="text"
          placeholder="Title"
          value={this.state.title}
          />
        <input onChange={this.updateBody}
          type='text' placeholder="Body" value={this.state.body}/>
        <input type="submit" value='Add Todo' />
      </form>
  );}
}

export default TodoForm;
