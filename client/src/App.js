import React, {Component} from 'react';
import './App.css';
import Home from './components/Home.js';
import Login from './registrations/Login.js';
import Signup from './registrations/Signup.js';
import ButterflyForm from './forms/ButterflyForm.js';
import ImageForm from './forms/ImageForm.js'
import {
  BrowserRouter,
  Switch,
  Route,
} from "react-router-dom";
import axios from 'axios';


class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      isLoggedIn: false,
      user: {}
    };
  }

  componentDidMount() {
    this.loginStatus()
  }

  loginStatus = () => {
    axios.get('http://localhost:3001/logged_in', { withCredentials: true })
    .then(response => {
      if(response.data.logged_in) {
        this.handleLogin(response)
      } else {
      this.handleLogout()
    }
  })
    .catch(error => console.log('api errors:',error))
  }

  handleLogin = (data) => {
    this.setState({
      isLoggedIn: true,
      user: data.user
    })
  }

  handleLogout = () => {
    this.setState({
      isLoggedIn: false,
      user: {}
    })
  }


  render() {
    return (
      <div className="App">
        <header className="App-header">
            <h2>Camp Butterfly</h2>
        </header>
          <BrowserRouter>
            <Switch>
          {/* Home Page */}
              <Route
                exact path='/'
                render={props => (
                  <Home {...props} handleLogout={this.handleLogout} loggedInStatus={this.state.isLoggedIn}/>
                  )}
                />
              <Route
                exact path='/login'
                render={props => (
                  <Login {...props} handleLogin={this.handleLogin} loggedInStatus={this.state.isLoggedIn}/>
                  )}
                />
              <Route
                exact path='/signup'
                render={props => (
                  <Signup {...props} handleLogin={this.handleLogin} loggedInStatus={this.state.isLoggedIn}/>
                  )}
              />
              <Route 
                exact path='/add'
                render={props => (
                  <ButterflyForm {...props} handleLogin={this.handleLogin} loggedInStatus={this.state.isLoggedIn} />
                  )}
                />
              <Route 
                exact path="/gallery"
                render={props => (
                  <ImageForm {...props} handleLogin={this.handleLogin} loggedInStatus={this.state.isLoggedIn} />
                  )}
              />
            </Switch>
          </BrowserRouter>
      </div>
    );
  }
}

export default App;
