module Api
  module V1
    class LatestStockPricesController < ActionController::API
      before_action :authenticate_request

      def price
        return render json: { error: 'missing params symbol' }, status: :bad_request if params[:symbol].blank?

        client = LatestStockPrice::Client.new
        render json: { status: 'success', price: client.price(params[:symbol]) }
      rescue StandardError => e
        render json: { error: e.message }, status: :bad_request
      end

      def prices
        return render json: { error: 'missing params symbol' }, status: :bad_request if params[:symbol].blank?
      
        client = LatestStockPrice::Client.new
        render json: { status: 'success', prices: client.prices(params[:symbol]) }
      rescue StandardError => e
        render json: { error: e.message }, status: :bad_request
      end

      def price_all
        client = LatestStockPrice::Client.new
        render json: { status: 'success', price_all: client.price_all }
      rescue StandardError => e
        render json: { error: e.message }, status: :bad_request
      end

      private

      def authenticate_request
        token = request.headers['Token']
        current_user = User.find_by(token:)
        render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user
      end
    end
  end
end
