import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/Root';
import configureStore from './store/store';
import * as Actions from './actions/session_actions';

window.login = Actions.login;

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById("root");
    const store = configureStore();
    window.store = store;
    ReactDOM.render(<Root store={ store } />, root);
});
