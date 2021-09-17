require "rails_helper"

RSpec.describe Api::V1::UsersController do
  let(:user_info) do
    {
      "email": "Lana@fake.com",
      "password": "password",
      "client_id": love.uid
    }
  end

  let!(:love) { Doorkeeper::Application.create(name: "Love", redirect_uri: "", scopes: "") }

  describe "#create" do
    before do
      post api_v1_users_path, params: user_info
    end
    
    it "should return status :ok" do
      expect(response).to have_http_status(:ok)
    end

    it "should return a user hash with info" do
      user_info = {
              id: "user.id",
              email: "user.email",
              access_token: "access_token.token",
              token_type: 'bearer',
              expires_in: "access_token.expires_in",
              refresh_token: "access_token.refresh_token",
              created_at: "access_token.created_at.to_time.to_i"
            }
      parse = JSON.parse(response.body, symbolize_names: true)

      expect(parse[:user].keys).to eq(user_info.keys)
    end

    describe "#log_in" do
      let(:params) do
        {
          "grant_type": user_info[:password],
          "email": user_info[:email],
          "password": user_info[:password],
          "client_id": love.uid,
          "client_secret": love.secret
        }
      end
  
      before do
        post oauth_token_path, params: params
      end
  
      it "can log in" do
        expected_response = {
          :access_token => "ibdtXwJNLPNd-QyIrVaqhzQ2I2qmfVoimCQnrf8viFM",
          :token_type => "Bearer",
          :expires_in => 7200,
          :refresh_token => "B-FyQOCrz3kKdPtbw28eTwEH1hG_4Yby3nrIAaUaRW8",
          :scope => "read",
          :created_at => 1631838352
          }

        parse = JSON.parse(response.body, symbolize_names: true)

        expect(parse.keys).to match(expected_response.keys)
      end
    end
  end
end
