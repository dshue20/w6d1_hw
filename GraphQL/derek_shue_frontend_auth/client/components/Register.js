import React from 'react';
import { Mutation } from 'react-apollo';
import { REGISTER_USER } from '../../src/graphql/mutations';

export default class Register extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            name: "",
            email: "",
            password: ""
        }
        this.update = this.update.bind(this);
        this.updateCache = this.updateCache.bind(this);
    }

    update(field){
        return e => this.setState({[field]: e.target.value})
    }

    updateCache(cache, {data}) {
        console.log(data);
        // here we can write directly to our cache with our returned mutation data
        cache.writeData({
          data: { isLoggedIn: data.register.loggedIn }
        });
    }

    render() {
        return (
          <Mutation
            mutation={REGISTER_USER}
            onCompleted={data => {
              console.log(data)
              const { token } = data.register;
              localStorage.setItem("auth-token", token);
            }}
            update={(cache, data) => this.updateCache(cache, data)}
          >
            {(registerUser) => (
                <div>
                    <form onSubmit={
                        e => {
                            e.preventDefault();
                            registerUser({
                                variables: {
                                    name: this.state.name,
                                    email: this.state.email,
                                    password: this.state.password
                                }
                            })
                        }
                    }>
                        <input 
                            value={this.state.name}
                            onChange={this.update("name")}
                            placeholder="Name"
                        />
                        <input
                            value={this.state.email}
                            onChange={this.update("email")}
                            placeholder="Email"
                        />
                        <input
                            value={this.state.password}
                            onChange={this.update("password")}
                            placeholder="Password"
                        />
                        <button type="submit">Register</button>
                    </form>
                </div>
            )}
          </Mutation>
        );
    }
}