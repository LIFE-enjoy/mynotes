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
    $('#comment-btn').on('click', function(e) {
      commentRoom.speak([$('#comment-text').val(), $('[data-user]').attr('data-user'), $('[data-note]').attr('data-note')]);
      $('#comment-text').val('');
      return e.preventDefault();
  });
});
