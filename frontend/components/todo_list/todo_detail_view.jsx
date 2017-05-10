import React from 'react';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
    this.deleteItem = this.deleteItem.bind(this);
  }

  deleteItem(e) {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  render () {
    return (
      <div>
        <p>
          {this.props.todo.body}
        </p>
        <button onClick={this.deleteItem}>Remove</button>
      </div>
    );
  }
}

export default TodoDetailView;
