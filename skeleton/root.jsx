import React from 'react';
import Clock from './frontend/clock';
import Weather from './frontend/weather';
import Autocomplete from './frontend/autocomplete';

const names = ["Anna", "Tony", "Sean", "Shawn", "Shaun", "Kelly", "Barack",
"Trump", "Melania", "Papa"];

const Root = () => (
    <div>
      <Clock />
      <Weather />
      <Autocomplete namesList= { names } />
    </div>
);



export default Root;
