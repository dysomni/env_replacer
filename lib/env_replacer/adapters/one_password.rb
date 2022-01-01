# frozen_string_literal: true

module EnvReplacer
  module Adapters
    # to use 1Password, only helpful for local development environments
    class OnePassword
      class << self
        def load_environment
          raise NotImplementedError
        end
      end
    end
  end
end
