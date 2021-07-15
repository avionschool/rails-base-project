import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
    const conversation_element = document.getElementById('conversation-id');
    const conversation_id = Number(conversation_element.getAttribute('data-conversation-id'));
    const send_button = document.getElementById('send-btn');
    const input_box = document.getElementById('message-input-box');

    // for terminating other subscriptions when connected to a new subscription
    consumer.subscriptions.subscriptions.forEach(subs => {
        consumer.subscriptions.remove(subs);
    });

    consumer.subscriptions.create({ channel: "ConversationChannel", conversation_id: conversation_id }, {
        connected() {
          // Called when the subscription is ready for use on the server
        },
      
        disconnected() {
          // Called when the subscription has been terminated by the server
        },
      
        received(data) {
          // Called when there's incoming data on the websocket for this channel
          const el_user_id = document.getElementById('user-id');
          const user_id = Number(el_user_id.getAttribute('data-user-id'));
      
          let html;
          user_id === data.message.user_id ? html = data.own_message : html = data.not_own_message;
          
          const messageContainer = document.getElementById('messages-container');
          messageContainer.innerHTML += html;
      
          send_button.disabled = false;
          input_box.value = '';
        }
      });
});



