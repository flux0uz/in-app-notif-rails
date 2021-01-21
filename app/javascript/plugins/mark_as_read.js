import Rails from "@rails/ujs";

const markAsRead = () => {
  const link = document.querySelector("[data-behavior='notifications-link']");
  const notifAlert = document.getElementById("notifications-count");

  if (link) {
    link.addEventListener("click", (event) => {
      Rails.ajax({
        url: "/notifications/mark_as_read",
        type: "POST",
        success: function (data) {
          notifAlert.classList.remove("red-circle");
        },
      });
    });
  }
};

export { markAsRead };
