import React, {Component} from 'react'
// import './Query.css';

class Query extends Component {

  render() {

  const file_extension = "../assets/images/" + this.props.data.attachment;

    return (
      <div className="query">
        <div>Butterfly Name: {this.props.data.image_content} </div>
            <br/>
        <div>Scientific Name: {this.props.data.latitude} </div>
            <br/>
        <div>Image file name: {this.props.data.longitude} </div>

      </div>
    );
  }
}

export default Query;