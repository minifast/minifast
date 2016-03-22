require "spec_helper"
require 'hashie'

describe "index", type: :feature do
  let(:fake_data) do
    Hashie::Mash.new(team: {members: [{name: 'Rock Lobster'}]})
  end

  before do
    allow_any_instance_of(Middleman::Application).to receive(:data).and_return(fake_data)
    visit "/team"
  end

  it 'quotes the b-52s' do
    expect(page).to have_content 'Rock Lobster'
  end
end
