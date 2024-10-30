# frozen_string_literal: true

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

Dir.glob(File.expand_path("lib/**/*.rb", __dir__)).map(&:to_s).sort_by(&:length).each { |f| require(f) }

config[:contact_form_url] = ENV.fetch("GOOGLE_FORM_URL", "http://example.com")
config[:contact_name_id] = ENV.fetch("GOOGLE_FORM_NAME_ID", "name")
config[:contact_subject_id] = ENV.fetch("GOOGLE_FORM_SUBJECT_ID", "subject")
config[:google_maps_key] = ENV.fetch("GOOGLE_MAPS_KEY", nil)
config[:google_maps_private_key] = ENV.fetch("GOOGLE_MAPS_PRIVATE_KEY", nil)
config[:http_prefix] = ENV.fetch("RACK_BASE_URI", "http://localhost:4567")

activate :asset_host, host: config[:http_prefix]
activate :directory_indexes
activate :i18n, mount_at_root: :en
activate :meta_tags

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :cloudfront do |cloudfront|
  cloudfront.access_key_id = ENV.fetch("AWS_ACCESS_KEY_ID", nil)
  cloudfront.secret_access_key = ENV.fetch("AWS_SECRET_ACCESS_KEY", nil)
  cloudfront.distribution_id = ENV.fetch("CLOUDFRONT_DISTRIBUTION_ID", nil)
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket = ENV.fetch("BUCKET_NAME", nil)
  s3_sync.region = ENV.fetch("BUCKET_REGION", nil)
  s3_sync.aws_access_key_id = ENV.fetch("AWS_ACCESS_KEY_ID", nil)
  s3_sync.aws_secret_access_key = ENV.fetch("AWS_SECRET_ACCESS_KEY", nil)
  s3_sync.prefer_gzip = true
  s3_sync.path_style = true
  s3_sync.after_build = false
  s3_sync.reduced_redundancy_storage = false
  s3_sync.version_bucket = true
  s3_sync.index_document = "index.html"
  s3_sync.error_document = "404.html"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

set :css_dir, "stylesheets"
set :js_dir, "javascripts"
set :images_dir, "images"
set :images_dir, "images"
set :fonts_dir, "fonts"

# Per-page layout changes
page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

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

# helpers do
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
  activate :minify_html

  activate :favicon_maker do |f|
    f.template_dir = "source/images/favicons"
    f.icons = {
      "large.png" => [
        {icon: "apple-touch-icon-180x180-precomposed.png"},
        {icon: "apple-touch-icon-152x152-precomposed.png"},
        {icon: "apple-touch-icon-144x144-precomposed.png"},
        {icon: "apple-touch-icon-120x120-precomposed.png"},
        {icon: "apple-touch-icon-114x114-precomposed.png"},
        {icon: "apple-touch-icon-76x76-precomposed.png"},
        {icon: "apple-touch-icon-72x72-precomposed.png"},
        {icon: "apple-touch-icon-60x60-precomposed.png"},
        {icon: "apple-touch-icon-57x57-precomposed.png"},
        {icon: "apple-touch-icon-precomposed.png", size: "57x57"},
        {icon: "apple-touch-icon.png", size: "57x57"},
        {icon: "favicon-196x196.png"},
        {icon: "favicon-160x160.png"},
        {icon: "favicon-96x96.png"},
        {icon: "mstile-70x70.png", size: "70x70"},
        {icon: "mstile-144x144.png", size: "144x144"},
        {icon: "mstile-150x150.png", size: "150x150"},
        {icon: "mstile-310x310.png", size: "310x310"},
        {icon: "mstile-310x150.png", size: "310x150"}
      ],
      "small.png" => [
        {icon: "favicon-32x32.png"},
        {icon: "favicon-16x16.png"},
        {icon: "favicon.png", size: "16x16"},
        {icon: "favicon.ico", size: "64x64,32x32,24x24,16x16"}
      ]
    }
  end
end

helpers do
  def t(*args, **kwargs)
    I18n.t(*args, **kwargs)
  end
end
