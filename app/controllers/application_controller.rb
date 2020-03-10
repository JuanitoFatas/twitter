class ApplicationController < ActionController::Base
  include Oath::ControllerHelpers

  def current_user
    super || Guest.new
  end
end
