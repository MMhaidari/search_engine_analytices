class ApplicationController < ActionController::Base
    before_action :set_turbo_frame
  
    protected
  
    def set_turbo_frame
      request.variant = :turbo_frame if turbo_frame_request?
    end
  
    def current_user
      @current_user ||= User.find_or_create_by(ip_address: request.remote_ip)
    end
  end
  