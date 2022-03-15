# frozen_string_literal: true

require 'middleman'
require 'capybara/rspec'
require 'webdrivers'

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

Capybara.register_driver :headless_chrome do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.args << '--window-size=1920,1080'
    opts.args << '--force-device-scale-factor=0.95'
    opts.args << '--headless'
    opts.args << '--disable-gpu'
    opts.args << '--disable-site-isolation-trials'
    opts.args << '--no-sandbox'
  end
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end

Capybara.javascript_driver = :headless_chrome
Capybara.server = :webrick
Capybara.app = ApplicationBuilder.new(File.expand_path('../..', __dir__)).to_app
