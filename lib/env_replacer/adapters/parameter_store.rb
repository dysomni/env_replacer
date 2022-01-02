# frozen_string_literal: true

module EnvReplacer
  module Adapters
    # uses AWS parameter store, a sub service of aws system manager
    class ParameterStore
      URL_SCHEME = 'ps'
      class << self
        def load_environment
          require 'aws-sdk'
          @ssm = Aws::SSM::Client.new
          matches = Environment.matches(URL_SCHEME)
          results = Parallel.map(matches, in_threads: 5) do |key, path|
            [key, @ssm.get_parameter(name: "/#{path.join('/')}", with_decryption: true).parameter.value]
          end
          results.each { |key, value| ENV[key] = value }
          true
        end

        def needed?
          Environment.any_match?(URL_SCHEME)
        end
      end
    end
  end
end
