TaskManager.Views.Tasks ||= {}

class TaskManager.Views.Tasks.IndexView extends Backbone.Marionette.CompositeView
  template: JST["backbone/templates/tasks/index"]
