import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { result: 0, num1: '', num2: '' };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
  }

  // your code here

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
      </div>
    );
  }

  setNum1(e) {
      this.setState({ num1: parseInt(e.target.value) });
  }

  setNum2(e) {
    this.setState({ num2: parseInt(e.target.value) });
  }
}

export default Calculator;