import consumer from "./consumer";

const initNotifCable = () => {
  const notifAlert = document.getElementById("notifications-count");

  consumer.subscriptions.create("NotificationChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      if (notifAlert) {
        notifAlert.classList.add("red-circle");
      }
      document
        .getElementById("notifications")
        .insertAdjacentHTML("afterbegin", data.html);
    },
  });
};

export { initNotifCable };
