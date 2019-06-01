# frozen_string_literal: true

require_relative "api"
require_relative "execution_response"

module JDoodle
  # Base model for interacting with the API
  class Client
    def initialize(client_id:, client_secret:)
      @client_id = client_id
      @client_secret = client_secret
    end

    # How many credits the client has used today
    #
    # @return [Integer]
    def credit_spent
      API.post(
        endpoint: "credit-spent",
        message: { clientId: @client_id, clientSecret: @client_secret }
      )["used"]
    end

    # Executes a code snippet
    #
    # @param language [Symbol] the programming language being used
    #
    # @yield the code snippet to be executed
    #
    # @example Execute a simple Ruby script
    #   jdoodle = JDoodle::Client.new(
    #     client_id: "CLIENT_ID",
    #     client_secret: "CLIENT_SECRET"
    #   )
    #
    #   jdoodle.execute :ruby do
    #     <<~CODE
    #       def add(x, y)
    #         x + y
    #       end
    #
    #       p add(1, 2)
    #     CODE
    #   end
    #
    # @return [JDoodle::ExecutionResponse]
    def execute(language)
      r = API.post(
        endpoint: "execute",
        message: {
          clientId: @client_id,
          clientSecret: @client_secret,
          script: yield,
          language: language,
          versionIndex: 0
        }
      )

      JDoodle::ExecutionResponse.new(
        output: r["output"],
        status_code: r["statusCode"],
        memory: r["memory"],
        cpu_time: r["cpuTime"]
      )
    end
  end
end
