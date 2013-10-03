# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid-settings/version'

Gem::Specification.new do |spec|
  spec.name = 'mongoid-settings'
  spec.version = Mongoid::Settings::VERSION
  spec.authors = ['Andrei Gladkyi']
  spec.email = ['arg@arglabs.net']
  spec.description = ''
  spec.summary = ''
  spec.homepage = 'https://github.com/agladkyi/mongoid-settings'
  spec.license = 'MIT'

  spec.files = `git ls-files`.split($/)
  spec.test_files = spec.files.grep(/^spec\//)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'mongoid', '>= 3.0.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 2.0.0'
end
