import React from 'react';

class ItemDetail extends React.Component{
  constructor(props) {
    super(props);
  }

  render () {
    let { item } = this.props;
    console.log(this.props);
    return (
      <ul>
        <li>{item.name}</li>
        <li>Happiness: {item.happiness}</li>
        <li>Price: {item.price}</li>
      </ul>
    );
  }
}

export default ItemDetail;
