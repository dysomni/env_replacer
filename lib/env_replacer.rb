# frozen_string_literal: true

require_relative 'env_replacer/version'
require_relative 'env_replacer/adapters'
require_relative 'env_replacer/environment'

# for modifying the ENV
module EnvReplacer
  @threads = 10
  class << self
    attr_accessor :threads

    def load(*adapters)
      adapters.each do |adapter|
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
