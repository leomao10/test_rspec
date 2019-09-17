require 'rails_helper'

describe 'Errors', type: :request do
  before do
    Rails.application.config.action_dispatch.show_exceptions = true
    Rails.application.config.consider_all_requests_local = false
  end

  after do
    Rails.application.config.action_dispatch.show_exceptions = false
    Rails.application.config.consider_all_requests_local = true
  end

  describe 'get to 404 directly' do
    context 'html' do
      it 'returns error page' do
        get '/404'
        expect(response).to render_template(:not_found)
      end

      it 'returns status code' do
        get '/404'
        expect(response.status).to eq(404)
      end
    end
  end

  describe 'not_found' do
    context 'html' do
      it 'returns error page' do
        get '/something-that-does-not-exist'
        expect(response).to render_template(:not_found)
      end

      it 'returns status code' do
        get '/something-that-does-not-exist'
        expect(response.status).to eq(404)
      end
    end
  end
end
