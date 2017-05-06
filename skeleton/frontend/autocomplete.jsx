import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super (props);
    this.namesList = props.namesList;
    this.state = { inputVal: "" };
    this.search = this.search.bind(this);
  }

  search (e) {
    e.preventDefault();
  }

  render() {
    return (
      <div>
        <h1>AUTOCOMPLETE</h1>
        <div className="widget">
          <input onChange={this.search} type="text"  value={this.state.inputVal}/>
          <ul>
          </ul>
        </div>
      </div>
      );
  }
}

export default Autocomplete;
