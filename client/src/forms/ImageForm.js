import React, {Component} from 'react'
import '../App.css';
import axios from 'axios';

// for adding any image

class GalleryForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
        image_content: '',
        latitude: '',
        longitude: ''
    };
    this.updateImage = this.updateImage.bind(this);
    this.addImage = this.addImage.bind(this);
  }

  updateImage(event) {
    const target = event.target;
    let value = target.value;

    const name = target.name;
      this.setState({
          [name]: value
      });
    //  console.log("pathname");
    //  console.log(value.readAsDataURL);
      // var filename = value.replace(/^.*\\/, "");
    //  console.log(filename);
    }

  async addImage(event) {
    event.preventDefault();
    
    // map props to image object
    let new_image = { 
        "image_content": this.state.image_content,
        "longitude": this.state.longitude,
        "latitude": this.state.latitude,
    };
    let response = ''
console.log(new_image);
    //await axios.post("http://enigmatic-spire-53426.herokuapp.com/api/v1/images?", new_image)
    //await axios.post("https://serene-wildwood-86252.herokuapp.com/api/v1/model", new_image)
    await axios.post("http://127.0.0.1:5000/api/v1/model", new_image)
        .then(result => {
         // this.setState({result:result.data});
         response = result.data
          console.log(result.data);
        })
        .catch(error => {
          if(error.response) {
            console.log(error.response);
          }
        });
    let id = ''
    // check id of response
    if (response === 0) {
      id = 'cabbage'
    }
    else if (response === 1) {
      id = 'ringlet'
    }
    else if (response === 2) {
      id = 'sulphur'
    }
    else if (response === 3) {
      id = 'milkweed'
    }
    else {
      id = 'none'
    }

    // Query the backend API for the database
    //let search = "http://localhost:3001/api/v1/butterflies.json/";
    let search = "https://enigmatic-spire-53426.herokuapp.com/api/v1/butterflies.json/";
      axios.get(search, {
        params: {
            butterfly_name: id
        }
      })
      .then(result => {
          this.setState({result:result.data});
          console.log(result.data);
        });    
    }

// basic add image form
  render() {
    return (
      <form className="add-form">
        <label>
          Add Image:
        </label>
        <br/>
            <label>
            Image Content:
            </label>
              <input
                  className="name"
                  type="string"
                  name="image_content"
                  value={this.state.value}
                  onChange={this.updateImage}
                />
            <label>
            <br/>
            Longitude:
            </label>
              {/*<input
                  className="name"
                  type="file"
                  name="longitude"
                  value={this.state.value}
                  onChange={this.updateImage}
                />*/}<input
                  className="name"
                  type="string"
                  name="longitude"
                  value={this.state.value}
                  onChange={this.updateImage}
                />
            <br/>
             <label>
             Latitude:
             </label>
              <input
                  className="name"
                  type="string"
                  name="latitude"
                  value={this.state.value}
                  onChange={this.updateImage}
                />
              <br/>
              <button  
                className="submit-button"
                onClick={this.addImage}>
                Submit
                </button>
      </form>

    );
  }
}

export default GalleryForm;
