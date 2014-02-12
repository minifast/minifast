require "spec_helper"

describe "contact", type: :feature do
  before do
    visit "/"
  end

  it "came from the company" do
    page.should have_selector "h1"
    page.should have_content "Ministry of Velocity"
  end
end
