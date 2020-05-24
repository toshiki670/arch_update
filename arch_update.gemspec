require_relative 'lib/arch_update/version'

Gem::Specification.new do |spec|
  spec.name          = "arch_update"
  spec.version       = ArchUpdate::VERSION
  spec.authors       = ["Toshiki"]
  spec.email         = ["toshiki.dev@protonmail.ch"]

  spec.summary       = %q{Archlinux updater}
  spec.description   = %q{desc}
  spec.homepage      = 'https://github.com/toshiki670/arch_update/wiki'
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/toshiki670/arch_update'
  spec.metadata["changelog_uri"] = 'https://github.com/toshiki670/arch_update/releases'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.13.1'
  spec.add_development_dependency 'rubocop', '~> 0.82.0'
end
