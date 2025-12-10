module AiScreenAnalyzer
  module AiScreenAnalyzerHelper
    def ai_screen_analyzer(options = {})
      prompt = options[:prompt] || AiScreenAnalyzer.default_prompt
      button_text = options[:button_text] || AiScreenAnalyzer.default_button_text
      sidebar_title = options[:sidebar_title] || AiScreenAnalyzer.default_sidebar_title
      
      render 'ai_screen_analyzer/shared/ai_screen_analyzer', {
        prompt: prompt,
        button_text: button_text,
        sidebar_title: sidebar_title
      }
    end
  end
end
