# frozen_string_literal: true

RSpec.describe EnvReplacer::Adapters do
  adapter_klasses = EnvReplacer::Adapters.constants.map do |c|
    EnvReplacer::Adapters.const_get(c)
  end

  it 'each is a class' do
    adapter_klasses.each do |klass|
      expect(klass.is_a?(Class)).to be true
    end
  end

  it 'each has URL_SCHEME' do
    adapter_klasses.each do |klass|
      expect(klass::URL_SCHEME).not_to be nil
    end
  end

  it 'each has load_environment' do
    adapter_klasses.each do |klass|
      expect(klass.respond_to?(:load_environment)).to be true
    end
  end
end
