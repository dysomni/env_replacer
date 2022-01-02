# frozen_string_literal: true

module EnvReplacer
  # for modifiying the environment or ENV
  module Environment
    class << self
      def matches(url_scheme)
        ENV.map do |key, value|
          if value.match(%r{#{url_scheme}://})
            path = value.match(%r{#{url_scheme}://(.+)})[1].split('/')
            [key, path]
          end
        end.compact
      end

      def match_keys(url_scheme)
        ENV.map do |key, value|
          if value.match(%r{#{url_scheme}://})
            path = value.match(%r{#{url_scheme}://(.+)})[1].split('/')
            ENV[key] = yield path
          end
        end
      end

      def any_match?(url_scheme)
        ENV.map do |_, value|
          value.match(%r{#{url_scheme}://})
        end.any?
      end
    end
  end
end
