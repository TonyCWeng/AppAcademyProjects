import React from 'react';
import {PokemonIndexItem} from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from 'react-router-dom';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
    this.displayPokemon = this.displayPokemon.bind(this);
  }

  componentDidMount () {
    return this.props.requestAllPokemon();
  }

  displayPokemon () {
    return (
      this.props.pokemon.map((poke) => {
        return (<PokemonIndexItem key={poke.id} poke={poke} />);
      })
    );
  }

  render () {
    return (
      <div id="app">
        <ul>
          {this.displayPokemon()}
        </ul>
        <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
      </div>
    );
  }
}

export default PokemonIndex;
