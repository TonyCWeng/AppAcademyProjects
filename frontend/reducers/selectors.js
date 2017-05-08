const allTodos = (state) => {
  const todoIds = Object.keys(state.todos);
  return todoIds.map( todoId => state.todos[todoId] );
};

export default allTodos;
