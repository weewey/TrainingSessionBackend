require 'faraday'

namespace :heroku do
  task :keepalive =>:environment do
    response = Faraday.get 'https://w-backend.herokuapp.com/ping'
    logger = Logger.new(STDOUT)
    logger.info response.status
  end
end
