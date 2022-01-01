# frozen_string_literal: true

require_relative 'env_replacer/version'
require_relative 'env_replacer/adapters'

# for modifying the ENV
module EnvReplacer
  class << self
    def match(url_scheme)
      ENV.each do |key, value|
        if value.match(%r{#{url_scheme}://})
          path = value.match(%r{#{url_scheme}://(.+)})[1].split('/')
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
