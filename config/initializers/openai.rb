require 'openai'

OpenAI.configure do |config|
  config.access_token = ENV['OPENAI_API_KEY']
end

Rails.logger.info "OpenAI API Key: #{ENV['OPENAI_API_KEY']}"
