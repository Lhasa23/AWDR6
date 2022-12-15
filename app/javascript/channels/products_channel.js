import consumer from "./consumer"

consumer.subscriptions.create("ProductsChannel", {
  received(data) {
    $('main.store [id^="product"].latest').removeClass("latest")
    $(`main.store #product_${data.id}`).replaceWith(data.html)
    $('.refresh-cart-btn')[0].click()
  }
});
