class EnvReplacer
  class Adapters
    class Credstash
      class << self
        def load_environment
          raise NotImplementedError
        end
      end
    end
  end
end
