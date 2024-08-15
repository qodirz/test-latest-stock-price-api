Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'

      get 'price', to: 'latest_stock_prices#price'
      get 'prices', to: 'latest_stock_prices#prices'
      get 'price_all', to: 'latest_stock_prices#price_all'
    end
  end
end
