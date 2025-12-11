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

      def mount_engine_routes
        routes_path = "config/routes.rb"

        if File.exist?(routes_path)
          content = File.read(routes_path)
          already_mounted = content.include?("AiScreenAnalyzer::Engine")

          unless already_mounted
            say_status :route, "Montando AiScreenAnalyzer::Engine em /ai_screen_analyzer", :green
            route "mount AiScreenAnalyzer::Engine => '/ai_screen_analyzer', as: 'ai_screen_analyzer_engine'"
          else
            say_status :route, "AiScreenAnalyzer::Engine já está montado (nenhuma alteração)", :blue
          end
        else
          say_status :warning, "Arquivo config/routes.rb não encontrado. Adicione manualmente: mount AiScreenAnalyzer::Engine => '/ai_screen_analyzer', as: 'ai_screen_analyzer_engine'", :yellow
        end
      end

      def display_readme
        puts <<~TEXT

          ╔════════════════════════════════════════════════════════════════╗
          ║         AI Screen Analyzer instalado com sucesso!             ║
          ╚════════════════════════════════════════════════════════════════╝

          Próximos passos:

          1. Rotas montadas automaticamente:
             - O engine foi montado em /ai_screen_analyzer
             - Endpoint de análise: POST /ai_screen_analyzer/analyze-screen
             - Se desejar mudar o path de montagem, ajuste em config/routes.rb e veja a seção "Rotas" do README.

          2. Configure sua chave de API da OpenAI:
             - Abra config/initializers/ai_screen_analyzer.rb
             - Descomente e configure as opções desejadas

          3. Adicione o helper em seu layout principal:
             <%= ai_screen_analyzer %>

          4. Certifique-se de que a variável de ambiente está definida:
             export OPENAI_API_KEY='sua_chave_aqui'

          Para mais informações, visite:
          https://github.com/seu-usuario/ai_screen_analyzer

        TEXT
      end
    end
  end
end
