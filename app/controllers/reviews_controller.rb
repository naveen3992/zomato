class ReviewsController < ApplicationController

def create 
	@review =Review.new(:review_text => params[:review])
	@review.user_id=current_user.id
	@review.restaurant_id=params[:id]
  	if @review.save 
  		flash[:success] = "Review Added "
  		
  	
   end
end 



end
