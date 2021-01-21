class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(recipient: current_user).recent
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    respond_to do |format|
      format.json { render json: {success:true, head: :no_content}, status: 200 }
    end
  end
end
