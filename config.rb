# frozen_string_literal: true

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

Dir.glob(File.expand_path('lib/**/*.rb', __dir__)).map(&:to_s).sort_by(&:length).each { |f| require(f) }

configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-NOPE'
  end
end

activate :i18n, mount_at_root: :en
activate :directory_indexes
activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :cloudfront do |cloudfront|
  cloudfront.access_key_id = ENV['AWS_ACCESS_KEY_ID']
  cloudfront.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  cloudfront.distribution_id = ENV['CLOUDFRONT_DISTRIBUTION_ID']
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket = ENV['BUCKET_NAME']
  s3_sync.region = ENV['BUCKET_REGION']
  s3_sync.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  s3_sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  s3_sync.prefer_gzip = true
  s3_sync.path_style = true
  s3_sync.after_build = false
  s3_sync.reduced_redundancy_storage = false
  s3_sync.version_bucket = true
  s3_sync.index_document = 'index.html'
  s3_sync.error_document = '404.html'
end

config[:contact_form_url] = ENV.fetch('GOOGLE_FORM_URL', 'http://example.com')
config[:contact_name_id] = ENV.fetch('GOOGLE_FORM_NAME_ID', 'name')
config[:contact_subject_id] = ENV.fetch('GOOGLE_FORM_SUBJECT_ID', 'subject')

# Layouts
# https://middlemanapp.com/basics/layouts/

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
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
  activate :dotenv, env: '.env'

  activate :google_analytics do |ga|
    ga.tracking_id = ENV.fetch('GOOGLE_ANALYTICS_TRACKING_ID')
    ga.debug = false
    ga.anonymize_ip = true
    ga.domain_name = 'ministryofvelocity.com'
    ga.allow_linker = true
  end
end
