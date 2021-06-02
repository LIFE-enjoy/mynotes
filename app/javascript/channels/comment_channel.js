import consumer from "./consumer"

const commentRoom = consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    const show_user = $('#user').data('user')
    console.log(show_user)
    console.log(data['chat_user'])
    if (data['chat_user'] == show_user){
        $('#contents-row').append(data['message_right'])
      }else{
        $('#contents-row').append(data['message_left'])
      }
    $('#contents-row').animate({ scrollTop: $('#contents-row')[0].scrollHeight},0)
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
