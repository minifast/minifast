require 'rspec'

Dir.glob(File.expand_path('../support/**/*.rb', __FILE__)) { |f| require(f) }

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
