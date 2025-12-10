require 'active_support'
require 'active_support/core_ext/module/attribute_accessors'
require "ai_screen_analyzer/version"
require "ai_screen_analyzer/engine" if defined?(Rails)

module AiScreenAnalyzer
  class Error < StandardError; end

  # Configuração padrão
  mattr_accessor :api_key
  mattr_accessor :model
  mattr_accessor :default_prompt
  mattr_accessor :default_button_text
  mattr_accessor :default_sidebar_title

  self.model = "gpt-4-turbo"
  self.default_prompt = "Analise o conteúdo visível nesta tela e descreva: 1) O que você vê, 2) Elementos principais, 3) Possíveis melhorias de UX/UI"
  self.default_button_text = "Analisar com IA"
  self.default_sidebar_title = "Análise da IA"

  def self.configure
    yield self if block_given?
  end
end
