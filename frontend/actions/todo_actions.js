import * as APIUtil from '../util/api_util.js';
import { receiveErrors } from './error_actions.js';
export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo
  };
};

export const removeTodo = (todo) => {
  return {
    type: REMOVE_TODO,
    todo
  };
};

export const fetchTodos = () => dispatch => (
  APIUtil.getTodos().then(todos => {
    dispatch(receiveTodos(todos));
  })
);

export function createTodo(todo) {
  return (dispatch) => {
    return APIUtil.createTodo(todo)
      .then(newTodo => dispatch(receiveTodo(newTodo)),
            err => dispatch(receiveErrors(err.responseJSON)));
  };
}

export function updateTodo(todo) {
  return (dispatch) => {
    return APIUtil.updateTodo(todo)
      .then(updatedTodo => dispatch(receiveTodo(updatedTodo)),
            err => dispatch(receiveErrors(err.responseJSON)));
  };
}
