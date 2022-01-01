# frozen_string_literal: true

module EnvReplacer
  module Adapters
    class Credstash
      class << self
        def load_environment
          raise NotImplementedError
        end
      end
    end
  end
end
