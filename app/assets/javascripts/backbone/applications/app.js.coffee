class TaskManager.Applications.TaskApplication extends Backbone.Marionette.Application
  regions:
	  list: '#list'
		task: '#task'

  onInitializeBefore: (options) ->
    @router = new TaskManager.Routers.TasksRouter

  onInitializeAfter: (options) ->
    if Backbone.history
      Backbone.history.start()

  onStart: (options) ->
    @tasks = new TaskManager.Collections.TasksCollection
    @tasks.fetch()
    console.log @tasks
#    client.subscribe '/visit', (msg) =>
#      console.log msg
#      this.collections.visits.fetch()
