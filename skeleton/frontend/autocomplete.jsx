import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super (props);
    this.namesList = props.namesList;
    this.state = { inputVal: "" };
    this.search = this.search.bind(this);
  }

  matches () {
    let matches = [];
    if (this.state.inputVal.length === 0) {
      return this.namesList;
    } else {
      for (var i = 0; i < this.namesList.length; i++) {
        let slice = this.namesList[i].slice(0, this.state.inputVal.length);
        if (slice.toLowerCase() === this.state.inputVal.toLowerCase()) {
          matches.push(this.namesList[i]);
        }
      }
    }
    if (matches.length === 0) {
      matches.push("No matches");
    }
    return matches;
  }

  search (e) {
    e.preventDefault();
    this.setState( {inputVal: e.currentTarget.value} );
  }

  render() {
    var result = this.matches().map( (match, idx) => {
      return (
        <li key={idx}>{match}</li>
      );
    });
    return (
      <div>

        <div className="widget">
          <h1>AUTOCOMPLETE</h1>
          <div className="big_box auto">
            <input onChange={this.search} type="text"  value={this.state.inputVal}
              placeholder="Type name to search!"/>
            <ul>
              {result}
            </ul>
          </div>
        </div>
      </div>
      );
  }
}

export default Autocomplete;
