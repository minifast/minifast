# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

Dir.glob(File.expand_path('lib/**/*.rb', __dir__)).map(&:to_s).sort_by(&:length).each { |f| require(f) }

configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-NOPE'
  end
end

activate :dotenv, env: '.env'
activate :i18n, mount_at_root: :en
activate :directory_indexes
activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

# Layouts
# https://middlemanapp.com/basics/layouts/

set :css_dir, 'stylesheets'
set :js_dir, 'stylesheets'
set :images_dir, 'images'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
  activate :minify_html

  activate :google_analytics do |ga|
    ga.tracking_id = ENV['GOOGLE_ANALYTICS_TRACKING_ID']
    ga.debug = false
    ga.anonymize_ip = true
    ga.domain_name = 'ministryofvelocity.com'
    ga.allow_linker = true
  end
end
