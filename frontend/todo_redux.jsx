import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import allTodos from './reducers/selectors.js';

const store = configureStore();
window.store = store;
window.allTodos = allTodos;

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(<h1>Todos App</h1>, document.getElementById('content'));
});
