import consumer from "./consumer"

const appLike = consumer.subscriptions.create("LikeChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(like_data) {
    replaceHTML(like_data.like_receiver)
  },

  send_like: function(like_data) {
    return this.perform('send_like', like_data)
  },
  delete_like: function(like_data) {
    return this.perform('delete_like', like_data)
  }
});

function replaceHTML(like_receiver){
  document.getElementById(`user-like-button-${like_receiver.id}`).innerHTML = buildHTML(like_receiver)
};

// jobでActionControllerのrendererメソッドを使ってViewを描画しようとしたが、Deviseの認証に引っかかるのでJS側で生成
function buildHTML(like_receiver) {
  return `<button class="like-cancel-button" value="${like_receiver.id}">いいね済み</button>`
}

onload = function() {
  $(".send-like-button").on("click", function(e){
    const receiver_id = $(this).val()
    const sender_id   = $(".like-sender-id").val()
    appLike.send_like({
      receiver_id: receiver_id,
      sender_id: sender_id
    });

    e.preventDefault();
  });

}
