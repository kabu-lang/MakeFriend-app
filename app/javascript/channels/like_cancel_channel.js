import consumer from "./consumer"

const appLikeCancel = consumer.subscriptions.create("LikeCancelChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(like_data) {
    replaceHTML(like_data["receiver_id"])
    // Called when there's incoming data on the websocket for this channel
  },

  delete_like: function(like_data) {
    return this.perform('delete_like', like_data);
  }
});

function replaceHTML(receiver_id){

  document.getElementById(`user-like-button-${receiver_id}`).innerHTML = buildHTML(receiver_id)
};

function buildHTML(receiver_id) {

  return `<button class="send-like-button" value="${receiver_id}">いいね</button>`
}



// https://qiita.com/sr2460/items/faee3d6459c236ff3280
document.addEventListener('DOMContentLoaded', function() {
  $(document).on("click",".like-cancel-button", function(e){
    const receiver_id = $(this).val()
    const sender_id   = $(".like-sender-id").val()
    appLikeCancel.delete_like({
      receiver_id: receiver_id,
      sender_id: sender_id
    });

    e.preventDefault();
  });
},false);
