module AiScreenAnalyzer
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc "Instala o AI Screen Analyzer e cria um arquivo de configuração"

      def create_initializer
        create_file "config/initializers/ai_screen_analyzer.rb", <<~RUBY
          # AI Screen Analyzer Configuration
          # Configure a gem AI Screen Analyzer aqui

          AiScreenAnalyzer.configure do |config|
            # Defina sua chave de API da OpenAI
            # config.api_key = ENV['OPENAI_API_KEY']

            # Modelo de IA a ser usado (padrão: gpt-4-turbo)
            # config.model = 'gpt-4-turbo'

            # Prompt padrão para análise
            # config.default_prompt = "Analise o conteúdo visível nesta tela..."

            # Texto do botão
            # config.default_button_text = "Analisar com IA"

            # Título da sidebar
            # config.default_sidebar_title = "Análise da IA"
          end
        RUBY
      end

      def display_readme
        puts <<~TEXT

          ╔════════════════════════════════════════════════════════════════╗
          ║         AI Screen Analyzer instalado com sucesso!             ║
          ╚════════════════════════════════════════════════════════════════╝

          Próximos passos:

          1. Configure sua chave de API da OpenAI:
             - Abra config/initializers/ai_screen_analyzer.rb
             - Descomente e configure as opções desejadas

          2. Adicione o helper em seu layout principal:
             <%= ai_screen_analyzer %>

          3. Certifique-se de que a variável de ambiente está definida:
             export OPENAI_API_KEY='sua_chave_aqui'

          Para mais informações, visite:
          https://github.com/seu-usuario/ai_screen_analyzer

        TEXT
      end
    end
  end
end
