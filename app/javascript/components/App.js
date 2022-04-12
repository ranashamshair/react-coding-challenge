import React, { Component, useState } from 'react';
import { BrowserRouter as Router, Routes, Route} from 'react-router-dom';
import Header from './Header'
import Home from './Home'
import Dashboard from './Dashboard'
import Login from './auth/Login'
import Signup from './auth/Signup'
// import '../tailwindcss/tailwind.css';



class App extends Component {

  constructor(){
    super();

    this.state = {
      loggedInStatus: "NOT_LOGED_IN",
      user: {},
    }
  }

  render(){
    return (
      <>
        <Router>
          <Header />
          <Routes>
            <Route exact path="/home" render={props => ( <Home {...props } loggedInStatus={this.state.loggedInStatus} /> )}/>
             <Route exact path="/dashboard" element={<Dashboard/>} />
             <Route path="/login" element={<Login/>} />
             <Route path="/signup" element={<Signup />} />
          </Routes>
        </Router>
      </>
    )
  }
}

export default App
