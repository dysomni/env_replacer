# frozen_string_literal: true

require_relative 'env_replacer/version'

class EnvReplacer

  ADAPTERS_DICT = {
    parameter_store: Adapters::ParameterStore,
    one_password: Adapcters::OnePassword
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

    end
  end
end