export const getTodos = () => {
  return $.ajax({ method: 'GET', url: '/api/todos' });
};

export const createTodo = (todo) => {
  return $.ajax({method: 'POST', url: '/api/todos', data: {todo}});
};

export const updateTodo = (todo) => {
  return $.ajax({method: 'PATCH', url: '/api/todos', data: {todo}});
};
