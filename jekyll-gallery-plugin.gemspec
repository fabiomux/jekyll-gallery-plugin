# frozen_string_literal: true

require_relative "lib/jekyll/gallery/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll-gallery-plugin"
  spec.version = Jekyll::Gallery::VERSION
  spec.authors = ["Fabio Mucciante"]
  spec.email = ["fabio.mucciante@gmail.com"]

  spec.summary = "Customizable Jekyll plugin that renders a gallery using the GLightbox Javascript library."
  spec.description = "It applies a gallery template and checks for the files listed presence."
  spec.homepage = "https://freeaptitude.altervista.org/projects/jekyll-gallery.html"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fabiomux/jekyll-gallery-plugin"
  spec.metadata["changelog_uri"] = "https://freeaptitude.altervista.org/projects/jekyll-gallery.html#changelog"
  spec.metadata["wiki_uri"] = "https://github.com/fabiomux/jekyll-gallery-plugin/wiki"
  spec.metadata["rubygems_mfa_required"] = "true"

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
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "jekyll", ">= 3.7", "< 5.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
