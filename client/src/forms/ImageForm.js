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
    const value = target.value;
    const name = target.name;
    const filename = value.replace(/^.*\\/, "");

      this.setState({
          [name]: filename
      });
    //  console.log("pathname");
    //  console.log(value.readAsDataURL);
      // var filename = value.replace(/^.*\\/, "");
    //  console.log(filename);
    }

  async addImage(event) {
    event.preventDefault();
    
    let new_image = { 
        "image_content": this.state.image_content,
        "longitude": this.state.longitude,
        "latitude": this.state.latitude,
    };
    // console.log(new_image);
    //let data = JSON.stringify(new_image,null);
    //await axios.post("http://enigmatic-spire-53426.herokuapp.com/api/v1/images?", new_image)
    await axios.post("http://localhost:3001/api/v1/images?", new_image)
        .then(result => {
         // this.setState({result:result.data});
          console.log(result.data);
        })
        .catch(error => {
          if(error.response) {
            console.log(error.response);
          }
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
