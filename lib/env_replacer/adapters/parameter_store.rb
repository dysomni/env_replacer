# frozen_string_literal: true

module EnvReplacer
  module Adapters
    # uses AWS parameter store, a sub service of aws system manager
    class ParameterStore
      class << self
        def load_environment
          require 'aws-sdk'
          @ssm = Aws::SSM::Client.new
          EnvReplacer.match('ps') do |path|
            @ssm.get_parameter(name: "/#{path.join('/')}", with_decryption: true).parameter.value
          end
        end
      end
    end
  end
end
