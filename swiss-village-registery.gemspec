# frozen_string_literal: true

require_relative "lib/swiss_village_registery/version"

Gem::Specification.new do |spec|
  spec.name = "swiss-village-registery"
  spec.version = SwissVillageRegistery::VERSION
  spec.authors = ["Liberatys"]
  spec.email = ["nick.flueckiger@renuo.ch"]

  spec.summary = "This gem provides a data set of all villages taken out of the Ortschaftenverzeichnis"
  spec.homepage = "https://github.com/Liberatys/swiss-village-registery"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Liberatys/swiss-village-registery"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.extensions << "ext/Rakefile"
  spec.add_runtime_dependency "thermite", "~> 0"
end
