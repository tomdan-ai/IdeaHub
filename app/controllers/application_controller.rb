class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!

    private
    def authenticate_user!
        token = request.headers['Authorization']&.split(' ')&.last
        decode_token = JwtService.decode(token)

        unless decode_token
        render json: { error: 'Unauthorized' }, status: unauthorized
        end
    end
end
