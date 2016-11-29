require 'sinatra/base'
require 'tilt/erubis'
require 'json'

require_relative 'test_app/racks'
require_relative 'test_app/helpers'

module TestApp
  class App < Sinatra::Base
    helpers do
      include TestApp::Helpers
    end

    get '/' do
      headers 'Vary' => 'Accept'

      respond_to do |wants|
        wants.html do
          @content = '<h1>Hello from TestApp</h1>'
          @title = 'TestApp'
          erb :index, layout: :default
        end

        wants.json do
          {
            app: 'TestApp'
          }.to_json
        end
      end
    end

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end
