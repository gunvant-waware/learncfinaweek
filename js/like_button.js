'use strict';
import './buttons';
class LikeButton extends React.Component {

  constructor(props) {
    super(props);
    this.state = { liked: false };
  }

  componentDidMount() {
    console.log(this.state, 'I am inside componentDidMount');
  };
  

  render() {
    console.log(this.state, 'I am inside render');
    if (this.state.liked) {
      return <GetUnlikeButton onClick = { () => this.setState({ liked: false }) } />
    }

    return <GetLikeButton onClick = { () => this.setState({ liked: true }) } />
  }
}


const domContainer = document.querySelector('#like_button_container');
ReactDOM.render(<LikeButton />, domContainer);