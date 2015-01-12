`import Ember from 'ember'`

TodoController = Ember.ObjectController.extend
  actions:
    editTodo: ->
      @set 'isEditing', true
    acceptChanges: ->
      @set 'isEditing', false

      if (Ember.isEmpty(@get 'model.title'))
        # The `doneEditing` action gets sent twice when the user hits
        # enter (once via 'insert-newline' and once via 'focus-out').
        #
        # We debounce our call to 'removeTodo' so that it only gets
        # made once.
        controller = @
        Ember.run.debounce(@, (->
          controller.send('removeTodo')
        ), 0)
      else
        @get('model').save()
    removeTodo: ->
      todo = @get 'model';
      todo.deleteRecord();
      todo.save();

  isEditing: false
  isCompleted: ((key, value) ->
    model = @get 'model'

    if value == undefined
      # property being used as a getter
      return model.get('isCompleted')
    else
      # property being used as a setter
      model.set('isCompleted', value)
      model.save()
      return value
  ).property('model.isCompleted')

`export default TodoController`
