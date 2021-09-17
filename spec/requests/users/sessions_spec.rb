require "rails_helper"

RSpec.describe Users::SessionsController do
  
  it "should return status :ok" do
    get new_user_session_path

    expect(response).to have_http_status(:ok)
  end

  it "should post to ok" do
    post user_session_path

    expect(response).to have_http_status(:ok)
  end

end