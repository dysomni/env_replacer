# frozen_string_literal: true

module EnvReplacer
  module Adapters
    # uses AWS parameter store, a sub service of aws system manager
    class ParameterStore
      URL_SCHEME = 'ps'
      class << self
        def load_environment
          puts "load env in parameterstore"
          require 'aws-sdk'
          puts "required aws-sdk"
          @ssm = Aws::SSM::Client.new
          puts "created ssm client"
          Environment.match(URL_SCHEME) do |path|
            puts "get param for #{path.join('/')}"
            @ssm.get_parameter(name: "/#{path.join('/')}", with_decryption: true).parameter.value
          end
        end

        def needed?
          Environment.any_match?(URL_SCHEME)
        end
      end
    end
  end
end
