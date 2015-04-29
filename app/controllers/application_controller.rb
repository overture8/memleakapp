class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :create_leak

  private

  def create_leak
    $leak ||= ''
    $leak << ("a" * 1.megabytes)
  end
end
