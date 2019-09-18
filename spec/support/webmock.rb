module WebMockHelpers
  def parse_params_for(request)
    parse_params_of request.uri.query
  end

  def parse_params_of(string)
    Rack::Utils.parse_nested_query string
  end

  def parse_body_for(request)
    JSON.parse request.body
  end

  def parse_form_body_for(request)
    URI.decode_www_form(request.body).to_h
  end
end

RSpec.configure do |config|
  config.include WebMockHelpers

  config.around(:each) do |example|
    webmock_disabled = example.metadata[:type] == :feature || example.metadata[:webmock] == false
    WebMock.disable! if webmock_disabled
    example.run
    WebMock.enable! if webmock_disabled
  end
end
