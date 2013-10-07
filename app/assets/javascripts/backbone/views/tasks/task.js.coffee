TaskManager.Views.Tasks ||= {}
class TaskManager.Views.Tasks.Task extends Backbone.Marionette.ItemView
  tagName:'tr'
  template:JST["backbone/templates/tasks/task"]
  initialize: ->
    @model.on('sync', () =>
      console.log 'model:sync'
      @render()
    )
  events:
    'click #delete':'deleteTask'
    'click #edit':'editTask'
  onRender: ->
    console.log 'render:view'
  deleteTask: ->
    console.log 'ok'
    @model.destroy(
      success: (model, response) ->
        app.client.publish('/task_delete', model.id)
        console.log model
      error: (model, response) ->
        console.log response
    )
  editTask: ->
    app.form.show new TaskManager.Views.Tasks.FormTask({model:@model})
    $('#modal').foundation('reveal', 'open')
