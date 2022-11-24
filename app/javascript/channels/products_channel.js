import consumer from "./consumer"

consumer.subscriptions.create("ProductsChannel", {
  received(data) {
    $('main.store').html(data.html)
  }
});
