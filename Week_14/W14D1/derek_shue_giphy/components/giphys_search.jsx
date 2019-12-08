import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            searchTerm: ''
        };
    }

    handleChange(e){
        this.setState({searchTerm: e.currentTarget.value});
    }

    handleSubmit(e){
        e.preventDefault();
        this.props.fetchSearchGiphys(this.state.searchTerm);
    }

    render(){
        <div>
            <form>
                <label>
                    Search
                    <input type="text" onChange={this.handleChange}/>
                </label>

                <label>
                    Submit
                    <input type="submit" onClick={this.handleSubmit}/>
                </label>
            </form>
            <GiphysIndex giphys={giphys} />
        </div>
    }
}

export default GiphysSearch;