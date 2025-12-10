AiScreenAnalyzer::Engine.routes.draw do
  post 'analyze-screen', to: 'ai_analyzer#analyze_screen', as: :analyze_screen
end
