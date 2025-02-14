# frozen_string_literal: true

require_relative "lib/md_block_converter/version"

Gem::Specification.new do |spec|
  spec.name = "md_block_converter"
  spec.version = MdBlockConverter::VERSION
  spec.authors = ["Liu Xiang"]
  spec.email = ["liuxiang921@gmail.com"]

  spec.summary = "A simple CLI to convert markdown block"
  spec.description = "A simple CLI to convert markdown block"
  spec.homepage = "https://github.com/lululau/md_block_converter"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "nokogiri", "~> 1.16.0"

  spec.add_development_dependency "gem-release", "~> 2.2.2"
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
