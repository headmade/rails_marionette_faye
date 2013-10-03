class TaskManager.Models.Task extends Backbone.Model
#	paramRoot: 'task'

  defaults:
    name: null
    status: null

class TaskManager.Collections.TasksCollection extends Backbone.Collection
  model: TaskManager.Models.Task
  url: '/tasks'
