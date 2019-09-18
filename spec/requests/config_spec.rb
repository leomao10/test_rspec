require 'rails_helper'

describe 'Config', type: :request do
  describe '#show' do
    it 'dummy test' do
      get '/config'
      expect(response.status).to eq(200)
    end
  end
end
