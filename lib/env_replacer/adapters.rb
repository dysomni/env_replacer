# frozen_string_literal: true

require_relative 'adapters/parameter_store'
require_relative 'adapters/one_password'
require_relative 'adapters/credstash'

module EnvReplacer
  ADAPTERS_DICT = {
    parameter_store: Adapters::ParameterStore,
    one_password: Adapters::OnePassword,
    credstash: Adapters::Credstash
  }.freeze
end
