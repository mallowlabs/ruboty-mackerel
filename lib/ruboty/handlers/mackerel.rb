require 'mackerel/client'

module Ruboty
  module Handlers
    class Mackerel < Base
      env :MACKEREL_APIKEY, "API key of Mackerel"

      on /mackerel host info/, name: "host_info", description: "See server list with mackerel"

      def host_info(message)
        body = begin
          mc = ::Mackerel::Client.new(mackerel_api_key: apikey)
          mc.get_hosts.map { |res|
            "name: #{res.name}, status: #{res.status}, id: #{res.id}, roles: #{res.roles}"
          }.join("\n")
        rescue => msg
          "[Error] #{msg}"
        end
        message.reply(body)
      end

      private
      def apikey
        ENV["MACKEREL_APIKEY"]
      end

    end
  end
end
