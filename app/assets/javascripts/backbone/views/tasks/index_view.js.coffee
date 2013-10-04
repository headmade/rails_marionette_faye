TaskManager.Views.Tasks ||= {}

class TaskManager.Views.Tasks.IndexView extends Backbone.Marionette.CompositeView
  itemView: TaskManager.Views.Task
  itemViewContainer: 'tbody'
  template: JST["backbone/templates/tasks/index"]
  events:
    'click #new':'new'
  new: =>
    console.log @
    @collection.create {}
