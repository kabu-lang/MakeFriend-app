import consumer from "./consumer"

consumer.subscriptions.create("LikeCancelChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  },

  delete_like: function() {
    return this.perform('delete_like');
  }
});

onload = function() {
  $(".like-cancel-button").on("click", function(e){

    const receiver_id = $(this).val()
    const sender_id   = $(".like-sender-id").val()
    appLike.delete_like({
      receiver_id: receiver_id,
      sender_id: sender_id
    });

    e.preventDefault();
  });

}
