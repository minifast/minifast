require 'spec_helper'

describe 'nav', type: :feature do
  before do
    visit '/'
  end

  it 'has a link to the team page' do
    expect(page).to have_link('Team')
  end
end
