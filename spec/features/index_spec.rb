require "spec_helper"

describe "index", type: :feature do
  before do
    visit "/"
  end

  it "shows the company name" do
    page.should have_selector "h1"
    page.should have_content "Ministry of Velocity"
  end
end
