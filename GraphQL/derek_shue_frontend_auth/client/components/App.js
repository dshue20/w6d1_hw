import React from "react";
import { Route, Switch } from "react-router-dom";
import PostIndex from "./posts/PostIndex";
import Register from "./Register";

const App = () => (
  <div>
    <Switch>
      <Route path="/" component={PostIndex} />
      <Route path="/register" component={Register} />
    </Switch>
  </div>
);

export default App;
