Connection = require('./connection').default
Subscriptions = require('./subscriptions').default


class Consumer
  constructor: (@url, @log, @WebSocket) ->
    @subscriptions = new Subscriptions(@)
    @connection = new Connection(@, @log, @WebSocket)

  send: (data) =>
    @connection.send(data)

  connect: =>
    @connection.open()

  disconnect: =>
    @connection.close(allowReconnect: false)

  ensureActiveConnection: =>
    unless @connection.isActive()
      @connection.open()

export default Consumer
