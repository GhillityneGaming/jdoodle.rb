# frozen_string_literal: true

module JDoodle
  # The result returned by a JDoodle::Client#execute call
  class ExecutionResponse
    # @return [String] the output of the program
    attr_reader :output

    # @return [Integer] the status code of the result
    attr_reader :status_code

    # @return [String] memory used by the program
    attr_reader :memory

    # @return [String] CPU time used by the program
    attr_reader :cpu_time

    def initialize(output:, status_code:, memory:, cpu_time:)
      @output = output
      @status_code = status_code
      @memory = memory
      @cpu_time = cpu_time
    end
  end
end
