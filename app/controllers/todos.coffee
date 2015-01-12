`import Ember from 'ember'`

TodosController = Ember.ArrayController.extend {
  actions:
    createTodo: ->
      # Get the todo title set by the "New Todo" text field
      title = @get 'newTitle'

      if !title.trim()
        return

      # Create the new Todo model
      todo = @store.createRecord('todo', {
        title: title,
        isCompleted: false
      })

      # Clear the "New Todo" text field
      @set 'newTitle', ''

      # Save the new model
      todo.save();
    clearCompleted: ->
      completed = @filterBy('isCompleted', true)
      completed.invoke('deleteRecord')
      completed.invoke('save')


  remaining: (->
    @filterBy('isCompleted', false).get 'length';
  ).property '@each.isCompleted'

  inflection: (->
    if @get('remaining') == 1 then 'item' else 'items';
  ).property('remaining')

  hasCompleted: (->
    @get('completed') > 0
  ).property('completed')

  completed: (->
    @filterBy('isCompleted', true).get 'length'
  ).property('@each.isCompleted')

  allAreDone: ((key, value) ->
    if (value == undefined)
      return !!@get('length') && @isEvery('isCompleted');
    else
      @setEach('isCompleted', value);
      @invoke('save');
      return value;
  ).property('@each.isCompleted')

}

`export default TodosController`
