Rails.application.routes.draw do
  # Api definition
  namespace :api, defaults: {format: :json},
                            contraints: {subdomain: 'api' }, paht: '/' do
    # We are going to list our resources here
  end
end
