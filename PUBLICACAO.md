# RubyGems Publishing Guide

This document describes how to publish the `ai_screen_analyzer` gem to RubyGems.

## Prerequisites

1. Account on [RubyGems.org](https://rubygems.org)
2. Git configured locally
3. Bundler installed

## Publishing Steps

### 1. Prepare the Git Repository

```bash
# Initialize Git repository (if not already)
git init

# Add all files
git add .

# Make the initial commit
git commit -m "Initial commit: AI Screen Analyzer gem v0.1.0"

# Create a tag for the version
git tag -a v0.1.0 -m "Release version 0.1.0"
```

### 2. Configure RubyGems Credentials

```bash
# Sign in to RubyGems
gem signin

# You will be prompted for your RubyGems email and password
```

### 3. Update Gem Information

Edit the `ai_screen_analyzer.gemspec` file and update:

```ruby
spec.authors = ['José Lopes Neto']
spec.email = ['jlneto@mcfox.com.br']
spec.homepage = 'https://github.com/mcfox/ai_screen_analyzer'
```

### 4. Build the Gem

```bash
gem build ai_screen_analyzer.gemspec
```

This will create a `.gem` file in the current directory.

### 5. Publish to RubyGems

```bash
gem push ai_screen_analyzer-0.1.0.gem
```

You will see a confirmation message when the gem is successfully published.

### 6. Verify the Publication

Visit `https://rubygems.org/gems/ai_screen_analyzer` to verify that the gem was published correctly.

## Future Updates

To publish a new version:

1. Update the version in `lib/ai_screen_analyzer/version.rb`
2. Update `CHANGELOG.md` with the changes
3. Commit and create a Git tag
4. Rebuild and publish the gem

```bash
# Example for version 0.2.0
gem build ai_screen_analyzer.gemspec
gem push ai_screen_analyzer-0.2.0.gem
```

## GitHub Setup

### Add Remote Repository

```bash
git remote add origin https://github.com/seu-usuario/ai_screen_analyzer.git
git branch -M main
git push -u origin main
git push origin v0.1.0
```

### Create a Release on GitHub

1. Go to https://github.com/seu-usuario/ai_screen_analyzer/releases
2. Click "Create a new release"
3. Select the tag `v0.1.0`
4. Add a description of the changes
5. Publish the release

## Recommended Improvements Before Publishing

- [ ] Add automated tests with RSpec
- [ ] Set up CI/CD (GitHub Actions)
- [ ] Add badges to README (build status, gem version, etc.)
- [ ] Complete documentation in README
- [ ] Usage examples
- [ ] MIT License configured
- [ ] CHANGELOG.md file updated

## Example Badges for README

```markdown
[![Gem Version](https://badge.fury.io/rb/ai_screen_analyzer.svg)](https://badge.fury.io/rb/ai_screen_analyzer)
[![Build Status](https://github.com/seu-usuario/ai_screen_analyzer/workflows/CI/badge.svg)](https://github.com/seu-usuario/ai_screen_analyzer/actions)
```

## Troubleshooting

### Error: "Gem already exists"

If you receive this error, it means the version has already been published. Update the version in `lib/ai_screen_analyzer/version.rb`.

### Error: "Unauthorized"

Make sure you are logged in with `gem signin` and that your credentials are correct.

### Error: "Invalid gemspec"

Check that the `ai_screen_analyzer.gemspec` file is correct and that all listed files exist.

## Support

For more information about publishing gems, visit:
- [RubyGems.org Help](https://guides.rubygems.org/)
- [Creating and Publishing Your First Ruby Gem](https://guides.rubygems.org/publishing/)
