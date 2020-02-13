require_relative 'lib/ds_watcher/version'

Gem::Specification.new do |spec|
  spec.name          = "ds_watcher"
  spec.version       = DsWatcher::VERSION
  spec.authors       = ["necrojan"]
  spec.email         = ["jan.dev1125@gmail.com"]

  spec.summary       = "A simple tool to check Demon Slayer manga chapter."
  spec.description   = "I love Demon Slayer Manga, so I decided to create this 
                      basic tool that checks if there are newly released chapters."
  spec.homepage      = "https://github.com/necrojan/ds_watcher"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
