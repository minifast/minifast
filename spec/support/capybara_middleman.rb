# frozen_string_literal: true

require 'middleman'
require 'capybara/rspec'
require 'selenium/webdriver'

class ApplicationBuilder
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def to_app
    app = ::Middleman::Application.new do
      set :watcher_disable, true
      set :show_exceptions, false
      set :environment, :test
      set :exit_before_ready, true
    end
    app.config[:source] = path
    ::Middleman::Rack.new(app).to_app
  end
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(headless disable-gpu) }
  )

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    desired_capabilities: capabilities
end

Capybara.javascript_driver = :headless_chrome
Capybara.server = :webrick
Capybara.app = ApplicationBuilder.new(File.expand_path('../../..', __FILE__)).to_app
