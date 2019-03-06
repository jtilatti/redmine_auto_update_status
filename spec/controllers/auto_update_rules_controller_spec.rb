require 'rails_helper'

RSpec.describe AutoUpdateRulesController, :type => :controller do

  before do
    User.current = User.find(1)
    @request.session[:user_id] = 1 # admin
    Setting.default_language = 'en'
  end

  context "GET new" do

    it "assigns a blank rule to the view" do
      get :new
      expect(response).to be_successful
      expect(assigns(:rule)).to be_a_new(AutoUpdateRule)
    end

  end

  context "POST create" do

    it "redirects to auto update rules page" do
      params = { auto_update_rule: { note: "This is a note" } }
      post :create, params: params

      expect(response).to redirect_to(auto_update_rules_path)
    end

  end

end