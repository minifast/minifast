require 'spec_helper'

describe HomeController do
  describe "get #index" do
    it "succeeds" do
      get :index
      response.should be_success
    end
  end
end
