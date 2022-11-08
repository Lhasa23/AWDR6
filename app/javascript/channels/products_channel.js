import consumer from './consumer'

consumer.subscriptions.create("ProductsChannel", {
  received(data) {
    $(`main.store #product_${data.id}`).replaceWith(data.html)
  }
});
