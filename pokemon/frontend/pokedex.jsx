import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
import { HashRouter, Route } from 'react-router-dom';
import { fetchSinglePokemon } from './util/api_util';
// import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';

// import { selectAllPokemon } from './reducers/selectors';


// window.receiveAllPokemon = receiveAllPokemon;
window.fetchSinglePokemon = fetchSinglePokemon;
// window.selectAllPokemon = selectAllPokemon;

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  //for testing
  window.store = store;
  // window.requestAllPokemon = requestAllPokemon;
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, rootEl);
});
