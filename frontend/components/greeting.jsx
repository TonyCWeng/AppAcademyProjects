import React from 'react';
import { Link } from 'react-router-dom';
const Greeting = ({currentUser, logout}) => {
  if (currentUser) {
    return (
      <div>
        <h2>Welcome {currentUser.username}</h2>
        <button onClick={(e) => (logout())}>Logout!</button>
      </div>
    );
  } else {
    return (
      <div>
        <Link to="/api/session">Login</Link>
        <Link to="/api/users">Sign Up</Link>
      </div>
    );
  }
};

export default Greeting;
