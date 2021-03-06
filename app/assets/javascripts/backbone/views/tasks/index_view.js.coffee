TaskManager.Views.Tasks ||= {}
class TaskManager.Views.Tasks.IndexView extends Backbone.Marionette.CompositeView
  template: JST["backbone/templates/tasks/index"]
  itemViewContainer: 'tbody'

  initialize: -> 
    @itemView=TaskManager.Views.Tasks.Task
    @collection.on('change', () ->
      console.log 'change:collection'
    )
  onRender: ->
    console.log 'render:collection'
  events:
    'click #new':'new'
  new: ->
    model = new TaskManager.Models.Task({})
    app.tasks.add(model)
    app.form.show(new TaskManager.Views.Tasks.FormTask({model:model}))
    $('#modal').foundation('reveal', 'open')
