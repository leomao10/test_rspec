class ErrorsController < ActionController::Base
  def show
    render 'not_found', status: :not_found
  end
end
