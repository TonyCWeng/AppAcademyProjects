import React from 'react';
import TodoDetailView from './todo_detail_view.jsx';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { visible: false };
    this.todo = props.todo;
    this.deleteItem = this.deleteItem.bind(this);
    this.switchStatus = this.switchStatus.bind(this);
    this.switchDetail = this.switchDetail.bind(this);
  }

  deleteItem(e) {
    e.preventDefault();
    this.props.removeTodo(this.todo);
  }

  btnStatus() {
    if (this.todo.done === true) {
      return "Undo";
    } else {
      return "Done";
    }
  }

  switchStatus(e) {
    e.preventDefault();
    if (this.todo.done === true) {
      this.todo.done = false;
    } else {
      this.todo.done = true;
    }
    this.props.receiveTodo(this.todo);
  }

  switchDetail(e) {
    e.preventDefault();
    if (this.state.visible === true) {
      this.setState({ visible: false });
    } else {
      this.setState({ visible: true });
    }
  }

  renderDetail () {
    if (this.state.visible) {
      return <TodoDetailView todo={this.todo}/>;
    } else {
      return null;
    }
  }

  render () {
    return (
      <div>
        <li>
          <a href="#" onClick={this.switchDetail}>{this.todo.title}</a>
          <button onClick={this.switchStatus}>{this.btnStatus()}</button>
        </li>
        {this.renderDetail()}
      </div>
    );
  }
}

export default TodoListItem;
