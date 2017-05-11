import React from 'react';

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
        return <li key={poke.id}>
          {poke.id}
          <img src={poke.image_url} height="50" width="50"/>
          {poke.name}
         </li>;
      })
    );
  }

  render () {
    return (
      <div>
        <ul>
          {this.displayPokemon()}
        </ul>
      </div>
    );
  }
}

export default PokemonIndex;
