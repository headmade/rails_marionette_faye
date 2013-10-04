TaskManager.Views.Tasks ||= {}
class TaskManager.Views.Tasks.Task extends Backbone.Marionette.ItemView
  tagName:'tr'
  template:JST["backbone/templates/tasks/task"]
