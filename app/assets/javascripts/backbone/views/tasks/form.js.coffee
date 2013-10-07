TaskManager.Views.Tasks ||= {}
class TaskManager.Views.Tasks.FormTask extends Backbone.Marionette.ItemView
  tagName:'form'
  template:JST["backbone/templates/tasks/form"]
  onShow: ->
    $('#modal').show()
    rivets.bind(@$el,{model:@model})
  events:
    'click #ok':'ok'
    'click #delete':'deleteTask'
  ok: ->
    @model.save({status: 0}, {
      success: (model) ->
        app.client.publish('/task_change', model.id)
    })
    $('#modal').foundation('reveal', 'close');
  deleteTask: ->
    @model.destroy(
      success: (model, response) ->
        app.client.publish('/task_delete', model.id)
        console.log model
      error: (model, response) ->
        console.log response
    )
    $('#modal').foundation('reveal', 'close');
