import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const room_id = $('#room-id').attr('data-room-id');
  consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id }, {
    connected() {
      console.log(`Connected to Channel ${room_id}`)
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      console.log(room_id)
      const user_id = $('#user-id').attr('data-user-id');
      let html;
      console.log(user_id);
      console.log(data.message.user_id);
      if (user_id == data.message.user_id) {
        html = data.mine
      }
      else{
        html = data.theirs
      }
      if (room_id == data.message.chat_room_id) {
        $(`#message-container-${data.message.chat_room_id}`).append(html);
      }
      
    }
  });
})