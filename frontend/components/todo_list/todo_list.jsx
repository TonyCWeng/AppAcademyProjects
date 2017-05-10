import React from 'react';
import TodoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form.jsx';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount () {
    this.props.fetchTodos();
  }

  render () {
    return (<div>
      <ul>
        {this.props.todos.map( todo => <TodoListItem
          key={todo.id}
          todo={todo}
          removeTodo={this.props.removeTodo}
          receiveTodo={this.props.receiveTodo}
          updateTodo={this.props.updateTodo}
        />) }

      </ul>
      <TodoForm createTodo={this.props.createTodo}
        errors={this.props.errors}
        clearErrors={this.props.clearErrors}
        receiveErrors={this.props.receiveErrors}/>
    </div>);
  }
}

export default TodoList;
