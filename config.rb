activate :dotenv
activate :livereload
activate :bourbon
activate :neat

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :sync do |sync|
  sync.fog_provider = 'AWS'
  sync.fog_directory = ENV['BUCKET_NAME']
  sync.fog_region = ENV['BUCKET_REGION']
  sync.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  sync.existing_remote_files = 'delete'
  sync.gzip_compression = true
end

activate :cloudfront do |cf|
  cf.access_key_id = ENV['AWS_ACCESS_KEY_ID']
  cf.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  cf.distribution_id = ENV['CLOUDFRONT_DISTRIBUTION_ID']
  cf.filter = /\.html$/i
end

configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-NOPE'
  end
end

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript

  activate :google_analytics do |ga|
    ga.tracking_id = ENV['GOOGLE_ANALYTICS_TRACKING_ID']
    ga.debug = false
    ga.anonymize_ip = true
    ga.domain_name = 'ministryofvelocity.com'
    ga.allow_linker = true
  end
end
