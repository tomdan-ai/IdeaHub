class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :authenticate_request
    before_action :authenticate_request, except: [:update_profile]
    include Pundit::Authorization

    private

    def current_user
      # Implement the logic to retrieve the current user
      # This might involve decoding the authentication token
    end

    def authenticate_request
      # You might want to exclude authentication for signup or specific actions here
      unless request.path == '/signup' || request.path == '/login'
        token = request.headers['Authorization']&.split(' ')&.last
        decode_token = JwtService.decode(token)

        unless decode_token
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError => e
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
