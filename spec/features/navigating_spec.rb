# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Navigating the site", type: :feature do
  it "describes the company", :js do
    visit "/"

    expect(page).to have_content(/ministry of velocity/i)

    expect(page).to be_axe_clean.excluding("footer", ".minifast-process")

    within "header" do
      click_link "Process"
    end

    expect(page).to be_axe_clean.excluding("footer")

    within "header" do
      click_link "Team"
    end

    expect(page).to be_axe_clean.excluding("footer")

    within "header" do
      click_link "Work"
    end

    expect(page).to be_axe_clean.excluding("footer")

    within "header" do
      click_link "Careers"
    end

    expect(page).to be_axe_clean.excluding("footer")

    within "header" do
      click_link "Contact"
    end

    expect(page).to be_axe_clean.excluding("footer")
  end
end
