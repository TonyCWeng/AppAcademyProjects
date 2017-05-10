import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import { fetchTodos } from './actions/todo_actions.js';
import Root from './components/root.jsx';
const store = configureStore();
window.store = store;

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(<Root store={store} />, document.getElementById('content'));
});
