# Development Guide

This document describes how to set up the development environment to work on the `ai_screen_analyzer` gem.

## Environment Setup

### 1. Clone the Repository

```bash
git clone https://github.com/seu-usuario/ai_screen_analyzer.git
cd ai_screen_analyzer
```

### 2. Install Dependencies

```bash
bundle install
```

### 3. Configure Environment Variables

Create a `.env` file at the project root:

```bash
OPENAI_API_KEY=your_key_here
```

## Project Structure

```
ai_screen_analyzer/
├── app/
│   ├── controllers/          # Gem controllers
│   ├── helpers/              # Gem helpers
│   └── views/                # Gem views
├── config/
│   └── routes.rb             # Gem routes
├── lib/
│   ├── ai_screen_analyzer.rb # Main file
│   ├── ai_screen_analyzer/
│   │   ├── engine.rb         # Rails Engine
│   │   └── version.rb        # Gem version
│   └── generators/           # Generators
├── spec/                     # Tests
├── Gemfile                   # Dependencies
├── Rakefile                  # Rake tasks
├── README.md                 # Documentation
└── ai_screen_analyzer.gemspec # Gem specification
```

## Development

### Run Tests

```bash
bundle exec rspec
```

### Run Linter

```bash
bundle exec rubocop
```

### Fix Linting Issues

```bash
bundle exec rubocop -A
```

## Testing the Gem Locally

### Option 1: Use the Gem in a Local Project

In your Rails project's `Gemfile`:

```ruby
gem 'ai_screen_analyzer', path: '../ai_screen_analyzer'
```

Then run:

```bash
bundle install
```

### Option 2: Install the Gem Locally

```bash
cd ai_screen_analyzer
gem build ai_screen_analyzer.gemspec
gem install ai_screen_analyzer-0.1.0.gem
```

## Adding New Features

### 1. Create a Branch

```bash
git checkout -b feature/new-feature
```

### 2. Make the Changes

Edit the necessary files and add tests.

### 3. Run Tests

```bash
bundle exec rspec
```

### 4. Commit

```bash
git add .
git commit -m "Add new feature"
```

### 5. Push and Create Pull Request

```bash
git push origin feature/new-feature
```

## Bumping the Version

1. Edit `lib/ai_screen_analyzer/version.rb`:

```ruby
module AiScreenAnalyzer
  VERSION = "0.2.0"  # Update the version
end
```

2. Update `CHANGELOG.md` with the changes

3. Commit:

```bash
git add .
git commit -m "Bump version to 0.2.0"
git tag -a v0.2.0 -m "Release version 0.2.0"
```

## Publishing a New Version

```bash
gem build ai_screen_analyzer.gemspec
gem push ai_screen_analyzer-0.2.0.gem
```

## Documentation

Documentation is generated using YARD. To generate the docs:

```bash
bundle exec yard
```

The documentation will be generated in `doc/`.

## Code Standards

This project follows:

- **Ruby Style Guide:** Configured via Rubocop
- **Rails Style Guide:** Rails conventions
- **Tests:** RSpec with best practices

## Contributing

1. Fork the repository
2. Create a branch for your feature (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Reporting Bugs

Use GitHub Issues to report bugs. Include:

- Clear description of the bug
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots (if applicable)
- Environment (Rails version, Ruby, etc.)

## Requesting Features

Use GitHub Discussions or Issues to request new features. Describe:

- The use case
- How the feature should work
- Usage examples

## Contact

For questions or suggestions, open an issue on GitHub.
