class TaskManager.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
    name: ''
    status: 0
    task: null

class TaskManager.Collections.UsersCollection extends Backbone.Collection
  model: TaskManager.Models.User
  url: '/users'
