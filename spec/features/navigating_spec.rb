# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Navigating the site', type: :feature do
  it 'shows the welcome message', :js do
    visit '/'

    expect(page).to be_accessible.excluding('footer', '.minifast-process')

    expect(page).to have_content(/pair programming/i)

    within 'header' do
      click_link 'Contact'
    end
  end
end
