import React, {Component} from 'react'
import '../App.css';
import axios from 'axios';

// for adding a butterfly type

class AddForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
        butterfly_name:'',
        scientific_name:'',
        image_file_name:'',
        description:''
    };
    this.updateItem = this.updateItem.bind(this);
    this.addItem = this.addItem.bind(this);
  }

// updates component's object key-value pairs
  updateItem(event) {
    const target = event.target;
    const value = target.value;
    const name = target.name;
      this.setState({
          [name]: value
      });
    }

// matches state params to object to be sent to server
  async addItem(event) {
    event.preventDefault();

   let new_butterfly = {
        "butterfly_name": this.state.butterfly_name,
        "scientific_name": this.state.scientific_name,
        "image_file_name": this.state.image_file_name,
        "description": this.state.description
   };
   //let data = JSON.stringify(new_butterfly,null);
   await axios.post("http://localhost:3001/api/v1/butterflies", new_butterfly)
      .catch(error => {
        if(error.response) {
          console.log(error.response);
        }
      });
    }

// basic add butterfly form
  render() {
    return (
      <form className="add-form">
        <label>
          Add Butterfly:
        </label>
          <br/>
            <label>
            Butterfly name:
            </label>
              <input
                  className="name"
                  type="string"
                  name="butterfly_name"
                  value={this.state.value}
                  onChange={this.updateItem}
                />
            <label>
            Scientific name:
            </label>
              <input
                  className="name"
                  type="string"
                  name="scientific_name"
                  value={this.state.value}
                  onChange={this.updateItem}
                />
            <label>
            <br/>
            Attach Image:
            </label>
              <input
                  className="name"
                  type="string"
                  name="image_file_name"
                  value={this.state.value}
                  onChange={this.updateItem}
                />
            <br/>
            <label>
            Description
            </label>
              <input
                  className="name"
                  type="text"
                  name="description"
                  value={this.state.value}
                  onChange={this.updateItem}
                />
              <br/>
              <button  
                className="submit-button"
                onClick={this.addItem}>
                Submit
                </button>
      </form>
    );
  }
}

export default AddForm;
