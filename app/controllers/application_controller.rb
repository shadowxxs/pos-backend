class ApplicationController < ActionController::API
  rescue_from BadRequestError do |e|
    render json: { error: e.message }, status: :bad_request
  end
end
