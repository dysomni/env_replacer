class EnvReplacer
  class Adapters
    class OnePassword
      class << self
        def load_environment
          raise NotImplementedError
        end
      end
    end
  end
end