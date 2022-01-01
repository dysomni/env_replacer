# frozen_string_literal: true

require_relative 'env_replacer/version'
require_relative 'env_replacer/adapters'

class EnvReplacer

  ADAPTERS_DICT = {
    parameter_store: Adapters::ParameterStore,
    one_password: Adapters::OnePassword,
    credstash: Adapters::Credstash
  }

  class << self
    def match(url_protocol, &block)
      ENV.each do |key, value|
        if value.match(/#{url_protocol}:\/\//)
          path = value.match(/#{url_protocol}:\/\/(.+)/)[1].split('/')
          ENV[key] = yield path
        end
      end
    end

    def load(*adapters)
      adapters.each do |adapter|
        ADAPTERS_DICT[adapter].load_environment
      end
    end
  end
end