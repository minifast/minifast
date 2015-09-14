require "spec_helper"

describe "index", type: :feature do
  before do
    visit "/"
  end

  it "shows the welcome message" do
    expect(page).to have_content "Patterns"
    expect(page).to have_content "Methodology"
  end
end
