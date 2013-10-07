class TaskManager.Applications.TaskApplication extends Backbone.Marionette.Application

  onInitializeBefore: (options) ->
    @addRegions
      'list': '#list'
      'task': '#edit'
      'form': '#modal'

  onInitializeAfter: (options) =>
    @tasks = new TaskManager.Collections.TasksCollection
    @tasks.fetch()
    @router = new TaskManager.Routers.TasksRouter
    if Backbone.history
      Backbone.history.start()

  onStart: (options) ->
#    client.subscribe '/visit', (msg) =>
#      console.log msg
#      this.collections.visits.fetch()
