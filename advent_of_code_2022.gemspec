# frozen_string_literal: true

require_relative "lib/advent_of_code_2022/version"

Gem::Specification.new do |spec|
  spec.name = "advent_of_code_2022"
  spec.version = AdventOfCode2022::VERSION
  spec.authors = ["Rémy Hannequin"]
  spec.email = ["remy@thoughtbot.com"]

  spec.summary = "Ruby version of the Advent of Code 2022"
  spec.description = "Ruby version of the Advent of Code 2022"
  spec.homepage = "https://github.com/rhannequin/advent_of_code_2022"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rhannequin/advent_of_code_2022"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "standard"
end
