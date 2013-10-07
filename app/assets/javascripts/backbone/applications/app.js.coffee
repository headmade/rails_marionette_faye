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
    @client = new Faye.Client 'http://localhost:9292/faye'
    @client.subscribe '/task_change', (id) =>
      model = @tasks.get(id)
      if !model
        @tasks.add new TaskManager.Models.Task id:id
        model = @tasks.get(id)
      model.fetch()
    @client.subscribe '/task_delete', (id) =>
      model = @tasks.get(id)
      if !!model
        model.destroy()
    if Backbone.history
      Backbone.history.start()

  onStart: (options) ->
#    client.subscribe '/visit', (msg) =>
#      console.log msg
#      this.collections.visits.fetch()
