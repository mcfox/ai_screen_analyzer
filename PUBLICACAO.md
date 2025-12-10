# Guia de Publicação no RubyGems

Este documento descreve como publicar a gem `ai_screen_analyzer` no RubyGems.

## Pré-requisitos

1. Conta no [RubyGems.org](https://rubygems.org)
2. Git configurado localmente
3. Bundler instalado

## Passos para Publicação

### 1. Preparar o Repositório Git

```bash
# Inicializar repositório Git (se ainda não estiver)
git init

# Adicionar todos os arquivos
git add .

# Fazer commit inicial
git commit -m "Initial commit: AI Screen Analyzer gem v0.1.0"

# Criar uma tag para a versão
git tag -a v0.1.0 -m "Release version 0.1.0"
```

### 2. Configurar Credenciais no RubyGems

```bash
# Fazer login no RubyGems
gem signin

# Você será solicitado a inserir seu email e senha do RubyGems
```

### 3. Atualizar Informações da Gem

Edite o arquivo `ai_screen_analyzer.gemspec` e atualize:

```ruby
spec.authors = ['José Lopes Neto']
spec.email = ['jlneto@mcfox.com.br']
spec.homepage = 'https://github.com/mcfox/ai_screen_analyzer'
```

### 4. Construir a Gem

```bash
gem build ai_screen_analyzer.gemspec
```

Isso criará um arquivo `.gem` no diretório atual.

### 5. Publicar no RubyGems

```bash
gem push ai_screen_analyzer-0.1.0.gem
```

Você verá uma mensagem de confirmação quando a gem for publicada com sucesso.

### 6. Verificar a Publicação

Acesse `https://rubygems.org/gems/ai_screen_analyzer` para verificar se a gem foi publicada corretamente.

## Atualizações Futuras

Para publicar uma nova versão:

1. Atualize a versão em `lib/ai_screen_analyzer/version.rb`
2. Atualize o `CHANGELOG.md` com as mudanças
3. Faça commit e crie uma tag Git
4. Reconstrua e publique a gem

```bash
# Exemplo para versão 0.2.0
gem build ai_screen_analyzer.gemspec
gem push ai_screen_analyzer-0.2.0.gem
```

## Configuração do GitHub

### Adicionar Repositório Remoto

```bash
git remote add origin https://github.com/seu-usuario/ai_screen_analyzer.git
git branch -M main
git push -u origin main
git push origin v0.1.0
```

### Criar Release no GitHub

1. Acesse https://github.com/seu-usuario/ai_screen_analyzer/releases
2. Clique em "Create a new release"
3. Selecione a tag `v0.1.0`
4. Adicione uma descrição das mudanças
5. Publique a release

## Melhorias Recomendadas Antes de Publicar

- [ ] Adicionar testes automatizados com RSpec
- [ ] Configurar CI/CD (GitHub Actions)
- [ ] Adicionar badges ao README (build status, gem version, etc.)
- [ ] Documentação completa no README
- [ ] Exemplos de uso
- [ ] Licença MIT configurada
- [ ] Arquivo CHANGELOG.md atualizado

## Exemplo de Badge para README

```markdown
[![Gem Version](https://badge.fury.io/rb/ai_screen_analyzer.svg)](https://badge.fury.io/rb/ai_screen_analyzer)
[![Build Status](https://github.com/seu-usuario/ai_screen_analyzer/workflows/CI/badge.svg)](https://github.com/seu-usuario/ai_screen_analyzer/actions)
```

## Troubleshooting

### Erro: "Gem already exists"

Se receber este erro, significa que a versão já foi publicada. Atualize a versão em `lib/ai_screen_analyzer/version.rb`.

### Erro: "Unauthorized"

Certifique-se de que você fez login com `gem signin` e que suas credenciais estão corretas.

### Erro: "Invalid gemspec"

Verifique se o arquivo `ai_screen_analyzer.gemspec` está correto e se todos os arquivos listados existem.

## Suporte

Para mais informações sobre publicação de gems, visite:
- [RubyGems.org Help](https://guides.rubygems.org/)
- [Creating and Publishing Your First Ruby Gem](https://guides.rubygems.org/publishing/)
