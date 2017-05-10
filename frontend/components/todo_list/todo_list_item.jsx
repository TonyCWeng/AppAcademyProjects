import React from 'react';
import TodoDetailViewContainer from './todo_detail_view_container.jsx';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { visible: false };
    this.deleteItem = this.deleteItem.bind(this);
    this.switchStatus = this.switchStatus.bind(this);
    this.switchDetail = this.switchDetail.bind(this);
  }

  deleteItem(e) {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  btnStatus() {
    if (this.props.todo.done === true) {
      return "Undo";
    } else {
      return "Done";
    }
  }

  switchStatus(e) {
    e.preventDefault();
    if (this.props.todo.done === true) {
      this.props.todo.done = false;
    } else {
      this.props.todo.done = true;
    }
    this.props.updateTodo(this.props.todo);
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
      return <TodoDetailViewContainer todo={this.props.todo}/>;
    } else {
      return null;
    }
  }

  render () {
    return (
      <div>
        <li>
          <a href="#" onClick={this.switchDetail}>{this.props.todo.title}</a>
          <button onClick={this.switchStatus}>{this.btnStatus()}</button>
        </li>
        {this.renderDetail()}
      </div>
    );
  }
}

export default TodoListItem;
