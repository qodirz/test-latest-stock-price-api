module Api
  module V1
    class SessionsController < ActionController::API
      def create
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
          token = SecureRandom.hex(10)
          user.update(token:)
          render json: { status: 'success', token:, message: 'Logged in successfully', user_id: user.id }, status: :ok
        else
          render json: { status: 'error', message: 'Invalid email or password' }, status: :unauthorized
        end
      end
    end
  end
end
