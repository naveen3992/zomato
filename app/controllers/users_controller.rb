class UsersController < ApplicationController
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
  	else
  	render 'new'
    end
  end

end
