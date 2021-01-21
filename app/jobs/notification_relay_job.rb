class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
    # Do something later
    html = ApplicationController.render partial: "notifications/notification", locals: {notification: notification}, formats: [:html]
    ActionCable.server.broadcast "notification:#{notification.recipient_id}", html: html
  end
end
