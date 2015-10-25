class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { status: 422, message: e.message }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { status: 404, message: e.message }, status: :not_found
  end
  
  def authenticate!
    if user = authenticate_with_http_token { |api_key, options| User.find_by_api_key(api_key) }
      @current_user = user
    else
      render_unauthorized
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: { code: 401, message: 'Bad credentails.' }, status: 401
  end

  def current_user
    @current_user
  end
  helper_method :current_user
end
