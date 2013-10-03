class TaskManager.Applications.TaskApplication extends Backbone.Marionette.Application

  onInitializeBefore: (options) ->
    @addRegions
      'list': '#list'
      'task': '#task'

  onInitializeAfter: (options) =>
    @router = new TaskManager.Routers.TasksRouter
    if Backbone.history
      Backbone.history.start()

  onStart: (options) ->
    @tasks = new TaskManager.Collections.TasksCollection
    @tasks.fetch()
#    client.subscribe '/visit', (msg) =>
#      console.log msg
#      this.collections.visits.fetch()
