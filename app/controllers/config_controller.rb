class ConfigController < ApplicationController
  def show
    render json: {}.to_json
  end
end
