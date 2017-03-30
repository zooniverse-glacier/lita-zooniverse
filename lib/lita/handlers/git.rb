require 'pry'

module Lita
  module Handlers
    class Git < Handler
      config :git_login, required: true
      config :git_password, required: true

      route(/^panoptes tag production/, :tag_production, command: true, help: {"tag production" => "Applies the production tag to the current master commit"})

      def tag_production(response)
        client.create_ref('zooniverse/panoptes', "tags/production", master_sha)
        response.reply("Production tag applied to current master commit.")
      rescue StandardError => e
        response.reply("Not sure. Try shouting really hard. (#{e.message})")
      end

      def master
        @master ||= Octokit.ref('zooniverse/panoptes', 'heads/master')
      end

      def master_sha
        @master_sha ||= @master.object.sha
      end

      def client
        @client = Octokit::Client.new(:login => config.git_login, :password => config.git_password)
      end

      Lita.register_handler(self)
    end
  end
end
