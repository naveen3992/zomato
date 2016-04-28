class UsersController < ApplicationController


before_filter :authenticate_user!, except: [:login,:signup]

  def login
  end

  def signup
  	@user = User.new 
  end

  def show
  	@user=User.find(params[:id])
	end

  def create 
  	@user =User.new(params[:user])
  	if @user.save 
  		log_in @user
  		flash[:success] = "Welcome to Zomato!"
  		redirect_to @user
  	else
  	render 'new'
   end
    end
  

  def new 
  	@user=User.new
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
