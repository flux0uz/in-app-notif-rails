class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_variables

  def set_variables
    @notifications_unread = Notification.where(recipient: current_user).unread
    @notifications = Notification.where(recipient: current_user).recent
  end
end
