import consumer from "./consumer"

const commentRoom = consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    $('#contents-row').prepend(data['message']);
  },
  speak: function(comment) {
    return this.perform('speak',{message: comment});
  }
});

$(function(){
    $('#comment-text').on('keypress', function(e) {
    if (e.key === 'Enter'){
      commentRoom.speak([e.target.value, $('[data-user]').attr('data-user'), $('[data-note]').attr('data-note')]);
      e.target.value = '';
      return e.preventDefault();
    }
  });
});
