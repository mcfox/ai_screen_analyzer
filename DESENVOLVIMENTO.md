# Guia de Desenvolvimento

Este documento descreve como configurar o ambiente de desenvolvimento para trabalhar com a gem `ai_screen_analyzer`.

## Configuração do Ambiente

### 1. Clonar o Repositório

```bash
git clone https://github.com/seu-usuario/ai_screen_analyzer.git
cd ai_screen_analyzer
```

### 2. Instalar Dependências

```bash
bundle install
```

### 3. Configurar Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto:

```bash
OPENAI_API_KEY=sua_chave_aqui
```

## Estrutura do Projeto

```
ai_screen_analyzer/
├── app/
│   ├── controllers/          # Controllers da gem
│   ├── helpers/              # Helpers da gem
│   └── views/                # Views da gem
├── config/
│   └── routes.rb             # Rotas da gem
├── lib/
│   ├── ai_screen_analyzer.rb # Arquivo principal
│   ├── ai_screen_analyzer/
│   │   ├── engine.rb         # Rails Engine
│   │   └── version.rb        # Versão da gem
│   └── generators/           # Generators
├── spec/                     # Testes
├── Gemfile                   # Dependências
├── Rakefile                  # Tarefas Rake
├── README.md                 # Documentação
└── ai_screen_analyzer.gemspec # Especificação da gem
```

## Desenvolvimento

### Executar Testes

```bash
bundle exec rspec
```

### Executar Linter

```bash
bundle exec rubocop
```

### Corrigir Problemas de Linting

```bash
bundle exec rubocop -A
```

## Testando a Gem Localmente

### Opção 1: Usar a Gem em um Projeto Local

No seu `Gemfile` do projeto Rails:

```ruby
gem 'ai_screen_analyzer', path: '../ai_screen_analyzer'
```

Depois execute:

```bash
bundle install
```

### Opção 2: Instalar a Gem Localmente

```bash
cd ai_screen_analyzer
gem build ai_screen_analyzer.gemspec
gem install ai_screen_analyzer-0.1.0.gem
```

## Adicionando Novos Recursos

### 1. Criar um Branch

```bash
git checkout -b feature/novo-recurso
```

### 2. Fazer as Mudanças

Edite os arquivos necessários e adicione testes.

### 3. Executar Testes

```bash
bundle exec rspec
```

### 4. Fazer Commit

```bash
git add .
git commit -m "Add novo recurso"
```

### 5. Fazer Push e Criar Pull Request

```bash
git push origin feature/novo-recurso
```

## Atualizando a Versão

1. Edite `lib/ai_screen_analyzer/version.rb`:

```ruby
module AiScreenAnalyzer
  VERSION = "0.2.0"  # Atualize a versão
end
```

2. Atualize `CHANGELOG.md` com as mudanças

3. Faça commit:

```bash
git add .
git commit -m "Bump version to 0.2.0"
git tag -a v0.2.0 -m "Release version 0.2.0"
```

## Publicando uma Nova Versão

```bash
gem build ai_screen_analyzer.gemspec
gem push ai_screen_analyzer-0.2.0.gem
```

## Documentação

A documentação é gerada usando YARD. Para gerar a documentação:

```bash
bundle exec yard
```

A documentação será gerada em `doc/`.

## Padrões de Código

Este projeto segue os padrões:

- **Ruby Style Guide:** Configurado via Rubocop
- **Rails Style Guide:** Padrões Rails padrão
- **Testes:** RSpec com boas práticas

## Contribuindo

1. Fork o repositório
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## Reportando Bugs

Use o GitHub Issues para reportar bugs. Inclua:

- Descrição clara do bug
- Passos para reproduzir
- Comportamento esperado
- Comportamento atual
- Screenshots (se aplicável)
- Ambiente (versão do Rails, Ruby, etc.)

## Solicitando Features

Use o GitHub Discussions ou Issues para solicitar novas features. Descreva:

- O caso de uso
- Como a feature deveria funcionar
- Exemplos de uso

## Contato

Para dúvidas ou sugestões, abra uma issue no GitHub.
