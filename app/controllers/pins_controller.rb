class PinsController < ApplicationController   
	
	before_action :find_pin, only: [:show, :edit, :update, :upvote]
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@pins = if params[:term]
    		Pin.joins(:user).where('users.Username LIKE ?', "%#{params[:term]}%")
  		elsif user_signed_in?
			#@pins = Pin.all.order("created_at DESC") - show all posts by all users
			@feed_items = current_user.feed #Display feed items of current user where feed is defined in the user model.
		end
	end





	def new
		@pin = current_user.pins.build
	end

	def show
		@pin = Pin.find(params[:id])
	end

	def create
		@pin = current_user.pins.build(pin_params)

		if @pin.save
			redirect_to @pin, notice: "succesfully created new Pin"
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Pin was updated succcesfully"
		else
			render 'edit'
		end
	end

	def destroy
		@pin = Pin.find(params[:id])
		if @pin.present?
			@pin.destroy
		end
		redirect_to root_path
	end
	
	def upvote
		if current_user.voted_up_on? @pin	
			@pin.downvote_by current_user
			respond_to do |format|
				format.html { redirect_to :back}
				format.json { head :no_content }
				format.js   { render :layout => false }

			end			
		else 	
			@pin.upvote_by current_user	
			respond_to do |format|
				format.html { redirect_to :back}
				format.json { head :no_content }
				format.js   { render :layout => false }	
				
			end
		end
	end

	
	
	#-------------------------------------------------
	private

	def pin_params
		params.require(:pin).permit(:title, :description, :image, :term)
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end

end
