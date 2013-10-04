TaskManager.Views.Tasks ||= {}
class TaskManager.Views.Tasks.FormTask extends Backbone.Marionette.ItemView
  tagName:'form'
  template:JST["backbone/templates/tasks/form"]
  initialize: (options) ->
    if options? and not options.model
      @model = app.tasks.create({})

  onShow: ->
    $('#modal').show()
    console.log @model
    rivets.bind(@$el,{model:@model})
  events:
    'click #ok':'ok'
    'click #delete':'deleteTask'
  ok: ->
    @model.save()
    app.form.close()
  deleteTask: ->
    @model.destroy()
    app.form.close()