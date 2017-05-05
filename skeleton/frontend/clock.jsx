import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = {date: new Date ()};
    this.tick = this.tick.bind(this);
  }

  tick () {
    this.setState({date: new Date ()});
  }

  componentDidMount () {
    this.intervalID = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalID);
  }

  render () {
    var days = ['Sunday','Monday','Tuesday','Wednesday','Thursday',
    'Friday','Saturday'];
    var months = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"];
    const hours = this.state.date.getHours();
    const minutes = this.state.date.getMinutes();
    const seconds = this.state.date.getSeconds();
    const day = this.state.date.getDay();
    const dayName = days[day];
    const dayNumber = this.state.date.getDate();
    const month = this.state.date.getMonth();
    const monthName = months[month];
    const year = this.state.date.getFullYear();

    return (
    <div className="clock-widget">
      <h1>CLOCK</h1><br/>
      <div className="clock">
        <div className="clock-headers">
          Time:<br/>
          Date:
        </div>
        <div className="clock-data">
          { hours }:{ minutes }:{ seconds }<br/>
        { dayName } { monthName } { dayNumber } { year }
        </div>
      </div>
    </div>
    );
  }
}



export default Clock;
