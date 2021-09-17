module Users
  class SessionsController < Devise::SessionsController

    def new
      render json: {errors: "Please Sign Up", status: :unauthorized}
    end
    
    def create
      render json: { status: :ok }
    end
    
  end
end