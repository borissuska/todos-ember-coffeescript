`import Ember from 'ember'`

EditTodoComponent = Ember.TextField.extend {
  didInsertElement: ->
    @$().focus();
}

`export default EditTodoComponent`
