class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  helper_method :current_user
end
