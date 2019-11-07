import React, {Component} from 'react'
import '../App.css';
import axios from 'axios';
import ButterflyContainer from '../containers/ButterflyContainer.js';

class SearchForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
        query:'',
        result:[]
    };
    this.updateQuery = this.updateQuery.bind(this);
    this.fetchQueryResults = this.fetchQueryResults.bind(this);
  }

  updateQuery(event) {
      this.setState({
        query: event.target.value.toUpperCase()
      });
    }

  fetchQueryResults(event) {
    event.preventDefault();
    //let search = "https://localhost:3001/" + this.state.query;
    let search = "http://localhost:3001/api/v1/images.json";
      axios.get(search)
      .then(result => {
          this.setState({result:result.data});
          console.log(result.data);
        })
    }

  render() {

    let result = this.state.result.map((properties) =>
        <ButterflyContainer data={properties} />
    );

    return (
      <form>
        <span>
        <label>
          Search:
            <input
                className="search"
                type="text"
                value={this.state.value}
                onChange={this.updateQuery}
              />
        </label>
              <button  
                className="search-button"
                onClick={this.fetchQueryResults}>
                Search
                </button>
        </span>
              {result}
      </form>

    );
  }
}

export default SearchForm;