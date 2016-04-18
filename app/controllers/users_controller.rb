class UsersController < ApplicationController
  def login
  end

  def signup
  	@user = User.new 
  end

  def show
  	@user=User.find(params[:id])


  	@restaurants = Restaurant.search(params[:search])

    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @restaurants }
  end

  def create 
  	@user =User.new(params[:user])
  	if @user.save 
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
