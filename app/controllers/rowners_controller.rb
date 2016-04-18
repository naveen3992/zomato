class RownersController < ApplicationController
  def login
  end

  def signup
  	@rowner=Rowner.new
  end

end
