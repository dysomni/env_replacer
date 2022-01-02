# frozen_string_literal: true

require_relative 'env_replacer/version'
require_relative 'env_replacer/adapters'
require_relative 'env_replacer/environment'

# for modifying the ENV
module EnvReplacer
  class << self
    def load(*adapters)
      adapters.each do |adapter|
        puts "about to load env #{adapter}"
        ADAPTERS_DICT[adapter].load_environment
      end
    end

    def needed(*adapters)
      adapters.map do |adapter|
        ADAPTERS_DICT[adapter].needed?
      end.any?
    end
  end
end
