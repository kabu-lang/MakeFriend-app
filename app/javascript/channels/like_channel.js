import consumer from "./consumer"

const appLike = consumer.subscriptions.create("LikeChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    test();
  },

  send_like: function(like_data) {
    return this.perform('send_like', like_data)
  }
});

// jobでActionControllerのrendererメソッドを使ってViewを描画しようとしたが、Deviseの認証に引っかかるのでJS側で生成
function buildHTML(like_receiver) {
  `<div></div>`
}

onload = function() {
  $(".like-button").on("click", function(e){
    const receiver_id = $(".like-button").val()
    const sender_id   = $(".like-sender-id").val()
    appLike.send_like({
      receiver_id: receiver_id,
      sender_id: sender_id
    });

    e.preventDefault();
  });

}
