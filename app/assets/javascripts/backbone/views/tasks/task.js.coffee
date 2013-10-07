TaskManager.Views.Tasks ||= {}
class TaskManager.Views.Tasks.Task extends Backbone.Marionette.ItemView
  tagName:'tr'
  template:JST["backbone/templates/tasks/task"]
  initialize: ->
    @model.on('change', () =>
      console.log 'change:model'
      @render()
    )
  events:
    'click #delete':'deleteTask'
    'click #edit':'editTask'
  onRender: ->
    console.log 'render:model'
  deleteTask: ->
    console.log 'ok'
    @model.destroy(
      success: (model, response) ->
        console.log model
      error: (model, response) ->
        console.log response
    )
  editTask: ->
    app.form.show new TaskManager.Views.Tasks.FormTask({model:@model})
