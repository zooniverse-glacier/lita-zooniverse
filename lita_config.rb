require 'bundler'

Lita.configure do |config|
  config.robot.name = "Lita"
  config.robot.log_level = :debug

  config.handlers.deployment.jenkins_username = ""
  config.handlers.deployment.jenkins_password = ""
  config.handlers.lintott.api_key = ""
  config.handlers.git_login = ""
  config.handlers.git_password = ""
end

require_relative 'lib/lita-zooniverse'