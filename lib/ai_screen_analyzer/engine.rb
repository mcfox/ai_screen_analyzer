module AiScreenAnalyzer
  class Engine < ::Rails::Engine
    isolate_namespace AiScreenAnalyzer

    # Garantir que helpers do engine sejam autocarregados/eager carregados
    config.autoload_paths << config.root.join('app/helpers')
    config.eager_load_paths << config.root.join('app/helpers')
    config.eager_load_namespaces << AiScreenAnalyzer

    initializer "ai_screen_analyzer.helpers" do
      # Certifica-se de que a constante do helper exista antes de qualquer constantize do Rails
      helper_path = AiScreenAnalyzer::Engine.root.join('app/helpers/ai_screen_analyzer/ai_screen_analyzer_helper.rb').to_s
      ActiveSupport::Dependencies.autoload_paths << File.dirname(helper_path) unless ActiveSupport::Dependencies.autoload_paths.include?(File.dirname(helper_path))

      ActiveSupport.on_load(:action_view) do
        require_dependency helper_path
        include AiScreenAnalyzer::AiScreenAnalyzerHelper
      end

      ActiveSupport.on_load(:action_controller) do
        require_dependency helper_path
        helper AiScreenAnalyzer::AiScreenAnalyzerHelper
      end
    end

    config.to_prepare do
      # Recarrega o helper em modo desenvolvimento para refletir mudanças
      helper_path = AiScreenAnalyzer::Engine.root.join('app/helpers/ai_screen_analyzer/ai_screen_analyzer_helper.rb').to_s
      begin
        require_dependency helper_path
        ActionView::Base.include AiScreenAnalyzer::AiScreenAnalyzerHelper
      rescue LoadError, NameError
        # Em ambientes onde o helper não é necessário, apenas ignore
      end
    end

  end
end
