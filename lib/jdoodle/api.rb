# frozen_string_literal: true

require "net/http"
require "json"

module JDoodle
  # Methods to interact with the API
  module API
    # JDoodle's API base URL
    BASE_URL = "https://api.jdoodle.com/v1"

    module_function

    # Sends a POST request to the API
    #
    # @param endpoint [String] the endpoint
    # @param message [String] the message
    #
    # @return [Hash]
    def post(endpoint:, message:)
      uri = URI("#{BASE_URL}/#{endpoint}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri, "Content-Type": "application/json")
      request.body = message.to_json

      JSON.parse(http.request(request).body)
    end
  end
end
