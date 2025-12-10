require 'spec_helper'
require 'ai_screen_analyzer'

describe AiScreenAnalyzer do
  it 'has a version number' do
    expect(AiScreenAnalyzer::VERSION).not_to be nil
  end

  it 'can be configured' do
    AiScreenAnalyzer.configure do |config|
      config.api_key = 'test_key'
      config.model = 'gpt-4-turbo'
    end

    expect(AiScreenAnalyzer.api_key).to eq('test_key')
    expect(AiScreenAnalyzer.model).to eq('gpt-4-turbo')
  end
end
