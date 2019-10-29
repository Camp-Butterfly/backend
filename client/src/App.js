import React, {Component} from 'react';
import './App.css';
import SearchForm from './forms/SearchForm.js';
import ButterflyForm from './forms/ButterflyForm.js';
import ImageForm from './forms/ImageForm.js'
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";


class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
            <h2>Camp Butterfly</h2>
        </header>
          <Router>
            <ul>
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/add">Add</Link>
              </li>
              <li>
                <Link to="/gallery">Gallery</Link>
              </li>
            </ul>
            <Switch>
          {/* Home Page */}
              <Route exact path="/">
                <SearchForm />
              </Route>
          {/* Add Butterfly */}
              <Route path="/add">
                <ButterflyForm />
              </Route>
          {/* Add Image */}
              <Route exact path="/gallery">
                <ImageForm/>
              </Route>
            </Switch>
          </Router>
      </div>
    );
  }
}

export default App;
