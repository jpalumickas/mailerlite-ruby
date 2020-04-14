# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mailerlite/version'

Gem::Specification.new do |spec|
  spec.name          = 'mailerlite'
  spec.version       = MailerLite::VERSION
  spec.authors       = ['Justas Palumickas']
  spec.email         = ['jpalumickas@gmail.com']

  spec.summary       = 'Ruby wrapper for MailerLite API v2'
  spec.description   = 'Ruby gem for MailerLite API v2'
  spec.homepage      = 'https://github.com/jpalumickas/mailerlite-ruby'

  spec.metadata = {
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
  spec.required_ruby_version = '>= 2.4.0'

  spec.add_dependency 'faraday', '~> 0.10'
  spec.add_dependency 'faraday_middleware', '~> 0.10'
  spec.add_dependency 'hashie', '>= 3.5.5'

  spec.add_development_dependency 'rake', '~> 13.0'
end
