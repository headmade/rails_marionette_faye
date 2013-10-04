TaskManager.Views.Tasks ||= {}
class TaskManager.Views.Tasks.IndexView extends Backbone.Marionette.CompositeView
  template: JST["backbone/templates/tasks/index"]
  itemViewContainer: 'tbody'

  initialize: -> 
    @itemView=TaskManager.Views.Tasks.Task

  events:
    'click #new':'new'
  new: =>
    console.log @
    @collection.create {}
