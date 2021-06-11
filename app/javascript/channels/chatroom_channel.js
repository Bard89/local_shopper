import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        // console.log(data);
        const element = document.getElementById("user-id");
        // console.log(element);
        const user_id = Number(element.getAttribute("data-user-id"));
  
        let html;
        if (user_id === data.message.user_id) {
          html = data.current_user_messages;
          // console.log(html);
        } else {
          html = data.other_user_messages;
          // console.log(html);
        }
        messagesContainer.insertAdjacentHTML('beforeend', html);
      }
    });
  }
}

export { initChatroomCable }; // export always at the end
