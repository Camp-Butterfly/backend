import React, {Component} from 'react'
// import './Query.css';

class Query extends Component {

  render() {

  const file_extension = "../assets/images/" + this.props.data.attachment;

    return (
      <div className="query">
        <div>Butterfly Name: {this.props.data.butterfly_name} </div>
            <br/>
        <div>Scientific Name: {this.props.data.scientific_name} </div>
            <br/>
        <div>Image file name: {this.props.data.attachment} </div>
            <img 
            	className="query-image"
            	src={file_extension}></img>
            <br/>
            {console.log(file_extension)}
        <div>Description: {this.props.data.description} </div>
      </div>
    );
  }
}

export default Query;