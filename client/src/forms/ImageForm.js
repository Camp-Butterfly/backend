import React, {Component} from 'react'
import '../App.css';
import axios from 'axios';

// for adding any image

class GalleryForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
        image_name: '',
        butterfly_name: '',
        location: '',
        attachment: ''
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
      console.log("pathname");
      console.log(value.readAsDataURL);
      // var filename = value.replace(/^.*\\/, "");
      console.log(filename);
    }

  async addImage(event) {
    event.preventDefault();

    let new_image = { 
        "image_name": this.state.image_name,
        "butterfly_name": this.state.scientific_name,
        "location": this.state.location,
        "attachment": this.state.attachment
    };
    console.log(new_image);
    //let data = JSON.stringify(new_image,null);
    await axios.post("http://localhost:3001/api/v1/images", new_image)
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
            Butterfly name:
            </label>
              <input
                  className="name"
                  type="string"
                  name="butterfly_name"
                  value={this.state.value}
                  onChange={this.updateImage}
                />
            <label>
            Scientific name:
            </label>
              <input
                  className="name"
                  type="string"
                  name="scientific_name"
                  value={this.state.value}
                  onChange={this.updateImage}
                />
            <label>
            <br/>
            Attach Image:
            </label>
              <input
                  className="name"
                  type="file"
                  name="attachment"
                  value={this.state.value}
                  onChange={this.updateImage}
                />
            <br/>
             <label>
             Location:
             </label>
              <input
                  className="name"
                  type="string"
                  name="location"
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
