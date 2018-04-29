# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Navigating the site', type: :feature do
  it 'shows the welcome message', :js do
    visit '/'

    expect(page).to be_accessible

    expect(page).to have_link('Blog')

    expect(page).to have_content(/Patterns/i)

    click_link 'Team'

    expect(page).to be_accessible

    click_link 'About'

    expect(page).to be_accessible
  end
end
