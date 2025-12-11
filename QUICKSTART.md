# Quick Start - AI Screen Analyzer

Comece a usar a gem em 5 minutos!

## 1. Instalar a Gem

Adicione ao seu `Gemfile`:

```ruby
gem 'ai_screen_analyzer'
```

Execute:

```bash
bundle install
```

## 2. Gerar Configuração

```bash
rails generate ai_screen_analyzer:install
```

O generator monta automaticamente o engine na sua aplicação host em `/ai_screen_analyzer`. O endpoint de análise fica acessível em `POST /ai_screen_analyzer/analyze-screen`.

Se quiser um caminho diferente, edite `config/routes.rb` do seu app:

```ruby
mount AiScreenAnalyzer::Engine => '/meu_path', as: 'ai_screen_analyzer_engine'
```

## 3. Configurar API Key

Defina sua chave da OpenAI:

```bash
export OPENAI_API_KEY='sua_chave_aqui'
```

Ou edite `config/initializers/ai_screen_analyzer.rb`:

```ruby
AiScreenAnalyzer.configure do |config|
  config.api_key = 'sua_chave_aqui'
end
```

## 4. Adicionar ao Layout

Abra `app/views/layouts/application.html.erb` e adicione antes de `</body>`:

```erb
<%= ai_screen_analyzer %>
```

## 5. Pronto!

Inicie seu servidor Rails:

```bash
rails server
```

Visite `http://localhost:3000` e você verá um botão roxo no canto inferior direito. Clique nele para analisar a tela!

## Exemplos Rápidos

### Análise de UX

```erb
<%= ai_screen_analyzer(
  prompt: "Analise a experiência do usuário desta página",
  button_text: "Revisar UX"
) %>
```

### Análise de Acessibilidade

```erb
<%= ai_screen_analyzer(
  prompt: "Verifique a acessibilidade desta página (WCAG)",
  button_text: "Verificar Acessibilidade"
) %>
```

### Análise de Conteúdo

```erb
<%= ai_screen_analyzer(
  prompt: "Analise a qualidade do conteúdo textual",
  button_text: "Analisar Conteúdo"
) %>
```

## Troubleshooting Rápido

**O botão não aparece?**
- Certifique-se de que o helper está no layout
- Verifique o console do navegador (F12)

**Análise não funciona?**
- Verifique se `OPENAI_API_KEY` está definida
- Verifique os logs do Rails

**Erro 404 no analyze-screen?**
- Confirme que o engine está montado (o generator faz isso automaticamente):
  ```ruby
  mount AiScreenAnalyzer::Engine => '/ai_screen_analyzer', as: 'ai_screen_analyzer_engine'
  ```
- Reinicie o servidor após alterar rotas
- Rode `bin/rails routes | grep ai_screen_analyzer` para verificar as rotas

**Erro de CORS?**
- Certifique-se de que recursos externos usam HTTPS

## Próximos Passos

- Leia o [README.md](README.md) para documentação completa
- Veja mais exemplos em [EXEMPLOS.md](EXEMPLOS.md) (se disponível)
- Contribua no [GitHub](https://github.com/seu-usuario/ai_screen_analyzer)

## Suporte

Abra uma issue no GitHub para dúvidas ou problemas.
