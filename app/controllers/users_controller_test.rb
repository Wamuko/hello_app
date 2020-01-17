class UsersController < ApplicationController
  def new
    if params[:nickname]
      params[:nickname] = params[:userid]
    end
    user = User.create(user_params)
    if user
      render :json => {
        'message' => 'Account successfully created',
        'user' => {
          'user_id' => user[:user_id],
          'nickname' => user[:nickname]
        }
      }
    else
      render :json => {
        'message' => 'Account creation failed',
        'cause' => 'required user_id and password'
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
