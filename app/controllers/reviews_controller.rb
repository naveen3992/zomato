class ReviewsController < ApplicationController

def create 
	@restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(params[:review])
current_user.reviews << @review
    respond_to do |format|
        format.html { redirect_to post_path(@restaurant) }
        format.js 
  		
  	
   end
end 



end
