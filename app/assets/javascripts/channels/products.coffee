App.products = App.cable.subscriptions.create "ProductsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
#START_HIGHLIGHT
    document.getElementsByTagName("main")[0].innerHTML = data.html
#END_HIGHLIGHT
