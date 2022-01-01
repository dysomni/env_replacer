# frozen_string_literal: true

module EnvReplacer
  module Adapters
    # for using the credstash gem TODO
    class Credstash
      URL_SCHEME = 'credstash'
      class << self
        def load_environment
          raise NotImplementedError
        end

        def needed?
          Environment.any_match?(URL_SCHEME)
        end
      end
    end
  end
end
