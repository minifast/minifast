# frozen_string_literal: true

require "middleman"
require "capybara/cuprite"
require "capybara/rspec"
require "middleman/rack"

Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    window_size: [1200, 800],
    browser_options: {"no-sandbox": nil}
  )
end

Capybara.javascript_driver = :cuprite
Capybara.server = :webrick
Capybara.app = Middleman.server
