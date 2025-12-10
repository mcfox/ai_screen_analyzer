# AI Screen Analyzer

Uma gem Rails elegante e poderosa que adiciona análise de tela com IA em qualquer aplicação. Com um simples helper, você pode capturar o conteúdo visual de qualquer página, enviar para análise com GPT-4V e exibir o resultado em uma barra lateral interativa.

## Características

- **Botão Flutuante Customizável:** Um botão elegante que aparece em qualquer página.
- **Captura de Tela Automática:** Utiliza `html2canvas` para capturar o conteúdo visual da página.
- **Análise com IA:** Integração com GPT-4V da OpenAI para análise inteligente.
- **Barra Lateral Responsiva:** Exibe resultados em uma sidebar elegante e não intrusiva.
- **Prompts Customizáveis:** Configure prompts diferentes para diferentes casos de uso.
- **Fácil Integração:** Basta adicionar uma linha de código em seu layout.
- **Sem Dependências Externas:** Usa apenas bibliotecas padrão do Rails.

## Instalação

Adicione a gem ao seu `Gemfile`:

```ruby
gem 'ai_screen_analyzer'
```

Execute o bundler:

```bash
bundle install
```

Execute o generator de instalação:

```bash
rails generate ai_screen_analyzer:install
```

## Configuração

### 1. Chave de API da OpenAI

Defina sua chave de API da OpenAI como variável de ambiente:

```bash
export OPENAI_API_KEY='sua_chave_secreta_aqui'
```

Ou configure no arquivo `config/initializers/ai_screen_analyzer.rb`:

```ruby
AiScreenAnalyzer.configure do |config|
  config.api_key = ENV['OPENAI_API_KEY']
  config.model = 'gpt-4-turbo'
end
```

### 2. Adicionar o Helper ao Layout

Abra seu layout principal (`app/views/layouts/application.html.erb`) e adicione:

```erb
<body>
  <%= yield %>
  
  <%= ai_screen_analyzer %>
</body>
```

## Uso

### Uso Básico

```erb
<%= ai_screen_analyzer %>
```

### Com Customizações

```erb
<%= ai_screen_analyzer(
  prompt: "Você é um especialista em UX. Analise esta interface e forneça feedback.",
  button_text: "Revisar Design",
  sidebar_title: "Feedback de UX"
) %>
```

## Opções

| Opção | Descrição | Padrão |
|-------|-----------|--------|
| `prompt` | O texto do prompt enviado para a IA junto com a imagem | "Analise o conteúdo visível nesta tela..." |
| `button_text` | Texto exibido no botão flutuante | "Analisar com IA" |
| `sidebar_title` | Título da barra lateral de resultados | "Análise da IA" |

## Exemplos de Uso

### Análise de UX/UI

```erb
<%= ai_screen_analyzer(
  prompt: "Você é um especialista em UX/UI. Analise esta interface e forneça feedback sobre: 1) Hierarquia visual, 2) Acessibilidade, 3) Consistência de design, 4) Sugestões de melhoria.",
  button_text: "Revisar Design",
  sidebar_title: "Feedback de UX/UI"
) %>
```

### Análise de Acessibilidade

```erb
<%= ai_screen_analyzer(
  prompt: "Você é um especialista em acessibilidade web (WCAG). Analise esta página e identifique possíveis problemas de acessibilidade.",
  button_text: "Verificar Acessibilidade",
  sidebar_title: "Análise de Acessibilidade"
) %>
```

### Análise de Conteúdo

```erb
<%= ai_screen_analyzer(
  prompt: "Analise o conteúdo textual desta página. Avalie: 1) Clareza da mensagem, 2) Qualidade da redação, 3) Adequação do tom.",
  button_text: "Analisar Conteúdo",
  sidebar_title: "Análise de Conteúdo"
) %>
```

## Como Funciona

1. O usuário clica no botão "Analisar com IA".
2. A biblioteca JavaScript `html2canvas` captura a imagem do corpo da página.
3. A imagem é convertida para base64 e enviada para o backend Rails.
4. O controller processa a imagem e a envia para a API do GPT-4V.
5. A IA analisa a imagem de acordo com o prompt fornecido.
6. O resultado é retornado e exibido na barra lateral.

## Estrutura da Gem

```
ai_screen_analyzer/
├── app/
│   ├── controllers/
│   │   └── ai_screen_analyzer/
│   │       └── ai_analyzer_controller.rb
│   ├── helpers/
│   │   └── ai_screen_analyzer/
│   │       └── ai_screen_analyzer_helper.rb
│   └── views/
│       └── ai_screen_analyzer/
│           └── shared/
│               └── _ai_screen_analyzer.html.erb
├── config/
│   └── routes.rb
├── lib/
│   ├── ai_screen_analyzer.rb
│   ├── ai_screen_analyzer/
│   │   ├── engine.rb
│   │   └── version.rb
│   └── generators/
│       └── ai_screen_analyzer/
│           └── install_generator.rb
├── ai_screen_analyzer.gemspec
├── Rakefile
├── README.md
├── LICENSE.txt
└── CHANGELOG.md
```

## Requisitos

- Rails 6.0 ou superior
- Ruby 2.7.0 ou superior
- Chave de API válida da OpenAI (com acesso ao modelo gpt-4-turbo)

## Solução de Problemas

### O botão não aparece

Verifique se o helper está sendo chamado corretamente no seu layout e se não há erros no console do navegador.

### A análise não funciona

Certifique-se de que:
- A chave de API da OpenAI está configurada corretamente
- Você tem créditos suficientes em sua conta OpenAI
- A rota está registrada corretamente

### Erro de CORS

Se você receber erros de CORS ao capturar a tela, verifique se todos os recursos externos estão usando HTTPS.

## Contribuindo

As contribuições são bem-vindas! Por favor, abra uma issue ou envie um pull request.

## Licença

Esta gem é licenciada sob a Licença MIT. Veja o arquivo LICENSE.txt para mais detalhes.

## Suporte

Para suporte, abra uma issue no repositório GitHub ou entre em contato com os mantenedores.

## Changelog

Veja o arquivo CHANGELOG.md para uma lista de todas as mudanças.

## Roadmap

- Suporte para outros modelos de IA (Claude, Gemini, etc.)
- Cache de análises anteriores
- Histórico de análises
- Exportação de resultados
- Integração com ferramentas de design
- Suporte para análise de múltiplas telas
