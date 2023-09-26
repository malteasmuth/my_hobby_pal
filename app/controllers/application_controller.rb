class ApplicationController < ActionController::Base
  # white list approach: protect every route by default
  before_action :authenticate_user!
end
