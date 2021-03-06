import React, { Component } from 'react'
import Signup from './auth/Signup'
import Login from './auth/Login';

export default class Home extends Component {
    constructor(props){
        super(props);

      }
      handleSuccessfulAuth(data) {
        this.props.handleLogin(data);
        this.props.history.push("/dashboard");
      }
    render() {
        return (
            <div>
                <h1>Home</h1>
                <h1>Status {this.props.loggedInStatus}</h1>
                <Signup handleSuccessfulAuth={this.handleSuccessfulAuth} />
                <Login handleSuccessfulAuth={this.handleSuccessfulAuth} />
            </div>
        )
    }
}
