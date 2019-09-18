Rails.application.routes.draw do
  get 'config', to: 'config#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/:status', to: 'errors#show', constraints: lambda { |request|
    Rack::Utils::HTTP_STATUS_CODES.keys.select{ |status| status >= 400 }.map(&:to_s).include?(request.params[:status])
  }
end
