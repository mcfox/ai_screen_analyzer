module AiScreenAnalyzer
  class Engine < ::Rails::Engine
    isolate_namespace AiScreenAnalyzer

    initializer "ai_screen_analyzer.helpers" do
      ActiveSupport.on_load(:action_view) do
        include AiScreenAnalyzer::AiScreenAnalyzerHelper
      end
    end
  end
end
