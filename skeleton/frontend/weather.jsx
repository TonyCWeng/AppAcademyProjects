import React from 'react';

class Weather extends React.Component {
  constructor() {
    super();
    this.loadXMLDoc = this.loadXMLDoc.bind(this);
    this.state = { message: "loading...", city: null, temp: null };
  }

  componentDidMount () {
    let funct = this;
    navigator.geolocation.getCurrentPosition(function(position) {
      funct.loadXMLDoc(position.coords.latitude, position.coords.longitude);
    });
  }

  loadXMLDoc(lat, lon) {
    const funct = this;
    var request = new XMLHttpRequest();
    request.open('GET',
    `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&APPID=8159d2ecaaa605e3c144d5470d41cf69`,
    true);
    request.onload = function() {
      if (request.status >= 200 && request.status < 400) {
        var resp = JSON.parse(request.response);
        const name = resp.name;
        const temp = (((resp.main.temp) * 9 / 5) - 459.67);
        const roundTemp = Math.round(temp*10) / 10;
        funct.setState({ city: name, temp: roundTemp, message: null });
      } else {
        console.log("error");
      }
      };

    request.send();
  }

  render(){
    return (
      <div className="widget">
        <h1>Weather</h1><br/>
        <div className="weather big_box">
          {this.state.city}<br/>
        {this.state.temp}<br/>
      // <img src="./icon.png" alt= "icon"/>
        </div>
      </div>
    );
  }
}
export default Weather;
