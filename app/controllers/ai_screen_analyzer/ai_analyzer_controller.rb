require 'base64'
require 'net/http'
require 'json'

module AiScreenAnalyzer
  class AiAnalyzerController < ActionController::Base
    skip_before_action :verify_authenticity_token, only: [:analyze_screen]

    def analyze_screen
      begin
        image_data = params[:image]
        prompt = params[:prompt]

        # Validar parâmetros
        return render_error('Imagem não fornecida') if image_data.blank?
        return render_error('Prompt não fornecido') if prompt.blank?

        # Remover data URI prefix se presente
        image_data = image_data.sub(/^data:image\/\w+;base64,/, '')

        # Chamar API do GPT-4V
        analysis = analyze_with_gpt4v(image_data, prompt)

        render json: {
          success: true,
          analysis: analysis
        }
      rescue StandardError => e
        render_error(e.message)
      end
    end

    private

    def analyze_with_gpt4v(image_data, prompt)
      api_key = ENV['OPENAI_API_KEY'] || AiScreenAnalyzer.api_key
      return 'Chave de API não configurada' if api_key.blank?

      uri = URI('https://api.openai.com/v1/chat/completions')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.path)
      request['Content-Type'] = 'application/json'
      request['Authorization'] = "Bearer #{api_key}"

      model = AiScreenAnalyzer.model || 'gpt-4-turbo'

      body = {
        model: model,
        messages: [
          {
            role: 'user',
            content: [
              {
                type: 'text',
                text: prompt
              },
              {
                type: 'image_url',
                image_url: {
                  url: "data:image/jpeg;base64,#{image_data}"
                }
              }
            ]
          }
        ],
        max_tokens: 1024
      }

      request.body = body.to_json

      response = http.request(request)
      result = JSON.parse(response.body)

      if response.code.to_i == 200
        result['choices'][0]['message']['content']
      else
        raise "Erro da API: #{result['error']['message']}"
      end
    end

    def render_error(message)
      render json: {
        success: false,
        error: message
      }, status: :unprocessable_entity
    end
  end
end
