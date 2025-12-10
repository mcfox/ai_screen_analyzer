require_relative "lib/ai_screen_analyzer/version"

Gem::Specification.new do |spec|
  spec.name = "ai_screen_analyzer"
  spec.version = AiScreenAnalyzer::VERSION
  spec.authors = ["José Lopes Neto"]
  spec.email = ["jlneto@mcfox.com.br"]

  spec.summary = "Rails helper gem para analisar telas com IA usando GPT-4V"
  spec.description = "AI Screen Analyzer é uma gem Rails que adiciona um botão flutuante em qualquer página para capturar a tela, enviar para análise com GPT-4V e exibir o resultado em uma barra lateral elegante."
  spec.homepage = "https://github.com/mcfox/ai_screen_analyzer"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mcfox/ai_screen_analyzer"
  spec.metadata["bug_tracker_uri"] = "https://github.com/mcfox/ai_screen_analyzer/issues"
  spec.metadata["changelog_uri"] = "https://github.com/mcfox/ai_screen_analyzer/releases"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob("lib/**/*") + Dir.glob(git commit -m "first commit""app/**/*") + Dir.glob("config/**/*") +
               ["README.md", "LICENSE.txt", "CHANGELOG.md"]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependências da gem
  spec.add_dependency "rails", ">= 6.0"

  # Dependências de desenvolvimento
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec-rails", "~> 5.0"
  spec.add_development_dependency "rubocop", "~> 1.0"
end
