import React from 'react';
import values from 'lodash/values';
import ItemDetailContainer from '../items/item_detail_container';
import { Link, Route } from 'react-router-dom';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
    this.displayItems = this.displayItems.bind(this);
  }

  componentDidMount () {
    return this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(nextProps) {
    if (this.props.match.params.pokemonId !== nextProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(nextProps.match.params.pokemonId);
    }
  }

  displayItems() {
    const { pokemonDetail } = this.props;
    return this.props.pokemonDetail.items.map((item) => {
      return (<li key={item.id}>
        <Link to={`/pokemon/${pokemonDetail.id}/items/${item.id}`}>
        <img src={item.image_url} />
        </Link>
      </li>);
    });
  }

  render () {
    return (
      <ul id="detail">
        <li><img src={this.props.pokemonDetail.image_url} /></li>
        <li>{this.props.pokemonDetail.name}</li>
        <li>Type: {this.props.pokemonDetail.type}</li>
        <li>Attack: {this.props.pokemonDetail.attack}</li>
        <li>Defense: {this.props.pokemonDetail.defense}</li>
        <li>Moves: {this.props.pokemonDetail.moves.join(', ')}</li>
        <li>Items: {this.displayItems()}</li>
        <Route path='/pokemon/:pokeId/items/:itemId' component={ItemDetailContainer}/>
      </ul>
    );
  }
}

export default PokemonDetail;
