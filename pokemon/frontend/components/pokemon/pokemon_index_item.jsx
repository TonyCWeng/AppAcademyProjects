import React from 'react';
import { Link } from 'react-router-dom';

export const PokemonIndexItem = (props) => {
  // console.log(poke);
  return (
    <li>
      <Link to={`/pokemon/${props.poke.id}`}>
        {props.poke.id}
        <img src={props.poke.image_url} height="50" width="50"/>
        {props.poke.name}
      </Link>
     </li>
  );
};
