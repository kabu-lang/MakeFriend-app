import consumer from "./consumer"

// 「const appCommunity =」を追記
const appCommunity = consumer.subscriptions.create("CommunityChannel", {
  // 省略

  received(data) {
    const messages = document.getElementById('community-chat-messages');
    messages.insertAdjacentHTML('beforeend', data['message']);
  },

  speak: function(message_data) {
    return this.perform('speak', {content: message_data['content'],user_id: message_data['user_id'],community_id: message_data['community_id']});
  }
});

onload = function() {
  $(".community-message-send-button").on("click", function(e){
    const user_id = $(".current-user-id-on-community-message").val()
    const community_id = $(".community-id").val()
    const message_content = $(".community-message-content").val()
    appCommunity.speak({
      content: message_content,
      user_id: user_id,
      community_id: community_id
    });
    $(".community-message-content").val("")
    e.preventDefault();
  });

}
