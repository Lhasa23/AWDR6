import consumer from "./consumer"

consumer.subscriptions.create("ProductsChannel", {
  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});
