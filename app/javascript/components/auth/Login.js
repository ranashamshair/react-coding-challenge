import React from "react"
import { LockClosedIcon } from '@heroicons/react/solid'
import { Link, useNavigate } from 'react-router-dom'
import axios from "axios";


class Login extends React.Component {

  constructor(props){
    super(props);

    this.state = {
      email: '',
      password: '',
      loginErrors: '',
      loggedIn: false
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event){
    this.setState({
      [event.target.name]: event.target.value
    })
  }

  handleSubmit(event){
    const {
      email,
      password
    } = this.state;

    axios.post('http://localhost:3000/users/sign_in',{
      user: {
        email: email,
        password: password
      }
    },
    {widthCredentials: true}
    ).then(response => {
      if (response.data.id) {
        this.setState({
           loggedIn: true
        })
      }
      console.log(response.data);
    }).catch(error => {
      console.log('signup error', error);
    });
    event.preventDefault();
  }

  render () {
    // if (this.state.loggedIn) {
    //    return <Redirect to={{
    //       pathname: '/dashboard',
    //     }} />
    //  }
    return (
      <React.Fragment>
      <div className="min-h-full flex items-center justify-center mt-5 py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-md w-full space-y-8">
        <div>
          <img
            className="mx-auto h-12 w-auto"
            src="https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg"
            alt="Workflow"
          />
          <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">Sign in to your account</h2>
          <p className="mt-2 text-center text-sm text-gray-600">
            Or{' '}

            <Link to="/signup" className="font-medium text-indigo-600 hover:text-indigo-500">
                 Have an Account ? Signup
              </Link>

          </p>
        </div>
        <form onSubmit={this.handleSubmit} className="mt-8 space-y-6">
          <input type="hidden" name="remember" defaultValue="true" />
          <div className="rounded-md shadow-sm -space-y-px">
            <div>
              <label htmlFor="email-address" className="sr-only">
                Email address
              </label>
              <input
                id="email-address"
                name="email"
                type="email"
                value={this.state.email}
                onChange={this.handleChange}
                autoComplete="email"
                required
                className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                placeholder="Email address"
              />
            </div>
            <div>
              <label htmlFor="password" className="sr-only">
                Password
              </label>
              <input
                id="password"
                name="password"
                type="password"
                value={this.state.password}
                onChange={this.handleChange}
                autoComplete="current-password"
                required
                className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                placeholder="Password"
              />
            </div>
          </div>

          <div>
            <button
              type="submit"
              className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
              <span className="absolute left-0 inset-y-0 flex items-center pl-3">
                <LockClosedIcon className="h-5 w-5 text-indigo-500 group-hover:text-indigo-400" aria-hidden="true" />
              </span>
              Log In
            </button>
          </div>
        </form>
      </div>
    </div>
    </React.Fragment>
    );
  }
}

export default Login
