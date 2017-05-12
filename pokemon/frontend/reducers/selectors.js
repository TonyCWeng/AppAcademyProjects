import values from 'lodash/values';

export const selectAllPokemon = (state) => {
  return values(state.pokemon);
};

export const selectPokemonItem = ({ pokemonDetail }, itemId) => {
  const idNum = parseInt(itemId);
  let foundItem = pokemonDetail.items.find( (item) => item.id === idNum);
  console.log(foundItem);
  return foundItem || {happiness: ""};
};
