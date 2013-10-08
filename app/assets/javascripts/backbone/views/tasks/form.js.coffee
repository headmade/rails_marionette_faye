TaskManager.Views.Tasks ||= {}
class TaskManager.Views.Tasks.FormTask extends Backbone.Marionette.ItemView
  tagName:'form'
  template:JST["backbone/templates/tasks/form"]
  events:
    'click #ok':'ok'
    'click #delete':'deleteTask'
    'click #close':'closeForm'
    'keypress #taskName':'pressEnter'

  ok: ->
    @unlock()
    $('#modal').foundation('reveal', 'close')

  deleteTask: ->
    @model.destroy(
      success: (model, response) =>
        app.client.publish('/task_delete', model.id)
        $('#modal').foundation('reveal', 'close')
      error: (model, response) ->
        console.log response
    )

  closeForm: ->
    @unlock()

  pressEnter: (e) ->
    if e.keyCode is 13
      @$el.find('#taskName').change()
      @ok()

  onShow: ->
    rivets.bind(@$el,{model:@model})
    @lock()

  lock: ->
    if !@model.isNew()
      @model.save({status: 1}, {
        success: (model) ->
          app.client.publish('/task_change', model.id)
      })

  unlock: ->
    @model.save({status: 0}, {
      success: (model) ->
        app.client.publish('/task_change', model.id)
    })
