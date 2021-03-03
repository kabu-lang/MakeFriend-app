import consumer from "./consumer"

// 「const appCommunity =」を追記
const appCommunity = consumer.subscriptions.create("CommunityChannel", {
  // 省略

  received(data) {
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', data['message']);
  },

  speak: function(message_data) {
    return this.perform('speak', {content: message_data['content'],user_id: message_data['user_id'],community_id: message_data['community_id']});
  }
});

  $(".community_message_send_button").on("click", function(e){
    const user_id = $(".current_user_id_on_community_message").val()
    const community_id = $(".community_id").val()
    const message_content = $(".community_message_content").val()
    appCommunity.speak({
      content: message_content,
      user_id: user_id,
      community_id: community_id
    });
    $(".community_message_content").val("")
    e.preventDefault();
  });
