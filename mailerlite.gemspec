# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mailerlite/version'

Gem::Specification.new do |spec|
  spec.name          = 'mailerlite'
  spec.version       = MailerLite::VERSION
  spec.authors       = ['Justas Palumickas']
  spec.email         = ['jpalumickas@gmail.com']

  spec.summary       = 'Ruby wrapper for MailerLite API v1'
  spec.description   = 'Ruby gem for MailerLite API v1'
  spec.homepage      = 'https://github.com/jpalumickas/mailerlite-ruby'

  spec.metadata = {
    'rubygems_mfa_required' => 'true',
    'bug_tracker_uri' => 'https://github.com/jpalumickas/mailerlite-ruby/issues',
    'changelog_uri' => 'https://github.com/jpalumickas/mailerlite-ruby/releases',
    'documentation_uri' => 'https://github.com/jpalumickas/mailerlite-ruby/tree/master/examples',
    'source_code_uri' => 'https://github.com/jpalumickas/mailerlite-ruby'
  }

  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`
    .split("\x0")
    .reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.7.0'

  spec.add_dependency 'faraday', '~> 2.0', '>= 2.0.1'
  spec.add_dependency 'faraday-follow_redirects', '~> 0.3'
  spec.add_dependency 'faraday-mashify', '~> 0.1'
  spec.add_dependency 'hashie', '>= 4', '< 6'
end
