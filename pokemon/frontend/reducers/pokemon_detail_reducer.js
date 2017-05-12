import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
const _initialState = {
  name: "",
  attack: "",
  defense: "",
  type: "",
  items: [],
  moves: []
};
const pokemonDetailReducer = (state = _initialState, action) => {
  switch (action.type) {
    case RECEIVE_SINGLE_POKEMON:
      return action.pokemon;
    default:
      return state;
  }
};

export default pokemonDetailReducer;
