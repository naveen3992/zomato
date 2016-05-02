class ReviewsController < ApplicationController


before_filter :authenticate_user! 

def create 
	@restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(params[:review][:review_text])
current_user.reviews << @review
Notifier.delay.review_created(@restaurant) 
    respond_to do |format|
        format.html { redirect_to post_path(@restaurant) }
        format.js 
  		
  	
   end


   def delete
   	@review=Review.find(params[:review_id])
   	@review.destroy
   	respond_to do |format|
   		format.html 
   		format.js
   	end



end 



end
