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
  }
});

function replaceHTML(like_receiver){
  document.getElementById(`user-list-item-${like_receiver.id}`).innerHTML = buildHTML(like_receiver)
};

// jobでActionControllerのrendererメソッドを使ってViewを描画しようとしたが、Deviseの認証に引っかかるのでJS側で生成
function buildHTML(like_receiver) {
  return `<a href="/users/${like_receiver.id}">
      <p class="user-name">名前：${like_receiver.name? like_receiver.name : "" }</p>
      <p class="user-gender">性別：${like_receiver.gender? like_receiver.gender : "" }</p>
      <p class="user-age">年齢：${like_receiver.birthday? like_receiver.birthday : "" }</p>
      <p class="user-cotegories">趣味：${like_receiver.categories ? like_receiver.categories : "" }</p>
      <p class="user-prefecture">居住エリア：${like_receiver.prefecture ? like_receiver.prefecture.name : "" }</p>
  </a>
  <div class="button-wrapper">
   <button class="liked-button" value="${like_receiver.id}">いいね済み</button>
  </div>
`
}

onload = function() {
  $(".like-button").on("click", function(e){
    const receiver_id = $(this).val()
    const sender_id   = $(".like-sender-id").val()
    appLike.send_like({
      receiver_id: receiver_id,
      sender_id: sender_id
    });

    e.preventDefault();
  });

}
