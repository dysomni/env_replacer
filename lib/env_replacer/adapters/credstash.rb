# frozen_string_literal: true

module EnvReplacer
  module Adapters
    # for using the credstash gem TODO
    class Credstash
      class << self
        def load_environment
          raise NotImplementedError
        end
      end
    end
  end
end
