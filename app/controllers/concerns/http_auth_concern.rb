module HttpAuthConcern
  extend ActiveSupport::Concern

  included do
    before_action :http_authenticate
  end

  def http_authenticate
    authenticate_or_request_with_http_basic('Login required') do |username, password|
      find_user_for_authorization(username, password)
    end
  end

  private

  def find_user_for_authorization(username, password)
    @user ||= User.where(login: username, active: true, status: true).first
    @user.authenticate(password) if @user
  end
end
