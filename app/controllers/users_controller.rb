class UsersController < ApplicationController
  def new
    if params[:nickname]
      params[:nickname] = params[:userid]
    end
    user = User.new(user_params)
    user.save
    if user
      render status: 200, :json => {
        'message' => 'Account successfully created',
        'user' => {
          'user_id' => user[:user_id],
          'nickname' => user[:nickname]
        }
      }
    else
      render status: 400, :json => {
        'message' => 'Account creation failed',
        'cause' => user.errors.full_messages
      }
    end
  end

  def update
  
  end
  
  def get
    
  end
  
  def delete
    
  end
  
  private
    def user_params
      params.require(:user_id, :password).permit(:user_id, :password, :comment, :nickname)
    end
    
    def update_params
      params.permit(:comment, :nickname)
    end
end
