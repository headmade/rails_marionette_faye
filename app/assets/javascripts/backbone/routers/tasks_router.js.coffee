class TaskManager.Routers.TasksRouter extends Backbone.Marionette.AppRouter
	routes:
    "": "index"

  index: ->
    app.list.show(new TaskManager.Views.Tasks.IndexView collection: app.tasks)

