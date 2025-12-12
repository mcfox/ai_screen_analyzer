# AI Screen Analyzer

An elegant and powerful Rails gem that adds AI-powered screen analysis to any application. With a simple helper, you can capture the visual content of any page, send it for analysis with GPT-4V, and display the result in an interactive sidebar.

## Features

- **Customizable Floating Button:** A sleek button that appears on any page.
- **Automatic Screenshot Capture:** Uses `html2canvas` to capture the visual content of the page.
- **AI Analysis:** Integration with OpenAI's GPT-4V for intelligent analysis.
- **Responsive Sidebar:** Displays results in an elegant, non-intrusive sidebar.
- **Customizable Prompts:** Configure different prompts for different use cases.
- **Easy Integration:** Just add one line of code to your layout.
- **No External Dependencies:** Uses only standard Rails libraries.

## Installation

Add the gem to your `Gemfile`:

```ruby
gem 'ai_screen_analyzer'
```

Run bundler:

```bash
bundle install
```

Run the installation generator:

```bash
rails generate ai_screen_analyzer:install
```

## Routes

The generator automatically mounts the engine in your host application. After installation, these routes are available by default:

- Engine mounted at: `/ai_screen_analyzer`
- Analysis endpoint: `POST /ai_screen_analyzer/analyze-screen`

If you need to mount manually (or customize the path), add this to your app's `config/routes.rb`:

```ruby
# Mount the AiScreenAnalyzer engine, exposing its routes under /ai_screen_analyzer
mount AiScreenAnalyzer::Engine => '/ai_screen_analyzer', as: 'ai_screen_analyzer_engine'

# (Optional) Direct alias for compatibility with existing calls
post '/ai_screen_analyzer/analyze-screen', to: 'ai_screen_analyzer/ai_analyzer#analyze_screen'
```

Notes:
- The gem's view uses route helpers to resolve the endpoint dynamically according to the mounted path, avoiding 404s when you customize the path.
- If you change the mount path, you don't need to change anything in the view; the helper will point to the new path.

## Configuration

### 1. OpenAI API Key

Set your OpenAI API key as an environment variable:

```bash
export OPENAI_API_KEY='your_secret_key_here'
```

Or configure it in `config/initializers/ai_screen_analyzer.rb`:

```ruby
AiScreenAnalyzer.configure do |config|
  config.api_key = ENV['OPENAI_API_KEY']
  config.model = 'gpt-4-turbo'
end
```

### 2. Add the Helper to the Layout

Open your main layout (`app/views/layouts/application.html.erb`) and add:

```erb
<body>
  <%= yield %>
  
  <%= ai_screen_analyzer %>
</body>
```

## Usage

### Basic Usage

```erb
<%= ai_screen_analyzer %>
```

### With Customizations

```erb
<%= ai_screen_analyzer(
  prompt: "You are a UX expert. Analyze this interface and provide feedback.",
  button_text: "Review Design",
  sidebar_title: "UX Feedback"
) %>
```

## Options

| Option | Description | Default |
|-------|-----------|--------|
| `prompt` | The prompt text sent to the AI along with the image | "Analyze the visible content on this screen..." |
| `button_text` | Text displayed on the floating button | "Analyze with AI" |
| `sidebar_title` | Title of the results sidebar | "AI Analysis" |

## Usage Examples

### UX/UI Analysis

```erb
<%= ai_screen_analyzer(
  prompt: "You are a UX/UI expert. Analyze this interface and provide feedback on: 1) Visual hierarchy, 2) Accessibility, 3) Design consistency, 4) Improvement suggestions.",
  button_text: "Review Design",
  sidebar_title: "UX/UI Feedback"
) %>
```

### Accessibility Analysis

```erb
<%= ai_screen_analyzer(
  prompt: "You are a web accessibility (WCAG) specialist. Analyze this page and identify potential accessibility issues.",
  button_text: "Check Accessibility",
  sidebar_title: "Accessibility Analysis"
) %>
```

### Content Analysis

```erb
<%= ai_screen_analyzer(
  prompt: "Analyze the textual content of this page. Evaluate: 1) Clarity of message, 2) Writing quality, 3) Tone appropriateness.",
  button_text: "Analyze Content",
  sidebar_title: "Content Analysis"
) %>
```

## How It Works

1. The user clicks the "Analyze with AI" button.
2. The `html2canvas` JavaScript library captures an image of the page body.
3. The image is converted to base64 and sent to the Rails backend.
4. The controller processes the image and sends it to the GPT-4V API.
5. The AI analyzes the image according to the provided prompt.
6. The result is returned and displayed in the sidebar.

## Gem Structure

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

## Requirements

- Rails 6.0 or higher
- Ruby 2.7.0 or higher
- Valid OpenAI API key (with access to the gpt-4-turbo model)

## Troubleshooting

### The button does not appear

Make sure the helper is being called correctly in your layout and there are no errors in the browser console.

### Analysis is not working

Ensure that:
- The OpenAI API key is configured correctly
- You have sufficient credits in your OpenAI account
- The route is registered correctly

### 404 error when calling analyze-screen

- Ensure the engine is mounted in the host app. By default, the generator already adds this line to your `config/routes.rb`:

  ```ruby
  mount AiScreenAnalyzer::Engine => '/ai_screen_analyzer', as: 'ai_screen_analyzer_engine'
  ```

- If you removed the automatic mount, add it manually as above.
- Restart the server after changing routes.
- Run `bin/rails routes | grep ai_screen_analyzer` to confirm the presence of the `analyze-screen` endpoint.

### CORS error

If you receive CORS errors when capturing the screen, ensure that all external resources are using HTTPS.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This gem is licensed under the MIT License. See LICENSE.txt for details.

## Support

For support, open an issue in the GitHub repository or contact the maintainers.

## Changelog

See the CHANGELOG.md file for a list of all changes.

## Roadmap

- Support for other AI models (Claude, Gemini, etc.)
- Cache of previous analyses
- Analysis history
- Export results
- Integration with design tools
- Support for multi-screen analysis
