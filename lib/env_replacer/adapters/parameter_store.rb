# frozen_string_literal: true

require 'parallel'

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
          Parallel.map(matches, in_threads: EnvReplacer.threads) do |key, path|
            ENV[key] = @ssm.get_parameter(name: "/#{path.join('/')}", with_decryption: true).parameter.value
          end
          true
        end

        def needed?
          Environment.any_match?(URL_SCHEME)
        end
      end
    end
  end
end
