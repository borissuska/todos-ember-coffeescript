`import Ember from "ember"`
`import config from "./config/environment"`

Router = Ember.Router.extend {
  location: config.locationType
}

Router.map ->
  @resource "todos", { path: "/" }, ->
    @route 'active'
    @route 'completed'

`export default Router`
