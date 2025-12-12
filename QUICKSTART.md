# Quick Start - AI Screen Analyzer

Start using the gem in 5 minutes!

## 1. Install the Gem

Add to your `Gemfile`:

```ruby
gem 'ai_screen_analyzer'
```

Run:

```bash
bundle install
```

## 2. Generate Configuration

```bash
rails generate ai_screen_analyzer:install
```

The generator automatically mounts the engine in your host application at `/ai_screen_analyzer`. The analysis endpoint is available at `POST /ai_screen_analyzer/analyze-screen`.

If you want a different path, edit your app's `config/routes.rb`:

```ruby
mount AiScreenAnalyzer::Engine => '/my_path', as: 'ai_screen_analyzer_engine'
```

## 3. Set the API Key

Set your OpenAI key:

```bash
export OPENAI_API_KEY='your_key_here'
```

Or edit `config/initializers/ai_screen_analyzer.rb`:

```ruby
AiScreenAnalyzer.configure do |config|
  config.api_key = 'your_key_here'
end
```

## 4. Add to the Layout

Open `app/views/layouts/application.html.erb` and add before `</body>`:

```erb
<%= ai_screen_analyzer %>
```

## 5. All set!

Start your Rails server:

```bash
rails server
```

Visit `http://localhost:3000` and you will see a purple button in the bottom-right corner. Click it to analyze the screen!

## Quick Examples

### UX Analysis

```erb
<%= ai_screen_analyzer(
  prompt: "Analyze this page's user experience",
  button_text: "Review UX"
) %>
```

### Accessibility Analysis

```erb
<%= ai_screen_analyzer(
  prompt: "Check this page's accessibility (WCAG)",
  button_text: "Check Accessibility"
) %>
```

### Content Analysis

```erb
<%= ai_screen_analyzer(
  prompt: "Analyze the quality of the textual content",
  button_text: "Analyze Content"
) %>
```

## Quick Troubleshooting

**Button not showing?**
- Make sure the helper is in the layout
- Check the browser console (F12)

**Analysis not working?**
- Check if `OPENAI_API_KEY` is set
- Check Rails logs

**404 error on analyze-screen?**
- Confirm the engine is mounted (the generator does this automatically):
  ```ruby
  mount AiScreenAnalyzer::Engine => '/ai_screen_analyzer', as: 'ai_screen_analyzer_engine'
  ```
- Restart the server after changing routes
- Run `bin/rails routes | grep ai_screen_analyzer` to verify routes

**CORS error?**
- Ensure external resources use HTTPS

## Next Steps

- Read the [README.md](README.md) for full documentation
- See more examples in [EXEMPLOS.md](EXEMPLOS.md) (if available)
- Contribute on [GitHub](https://github.com/seu-usuario/ai_screen_analyzer)

## Support

Open a GitHub issue for questions or problems.
