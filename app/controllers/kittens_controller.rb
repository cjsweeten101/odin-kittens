class KittensController < ApplicationController

	def index
		@kittens = Kitten.all

		respond_to do |format|
			format.json { render :json => @kittens }
		end
	end

	def show
		@kitten = Kitten.find_by(id:params[:id])

		respond_to do |format|
			format.json { render :json => @kitten }
		end
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			flash[:success] = "Kitten created!"
			redirect_to @kitten
		else
			flash.now[:error] = "Uh oh #{kitten.errors.messages}"
			render 'new'
		end
	end

	def edit
		@kitten = Kitten.find_by(id:params[:id])
	end

	def update
		@kitten = Kitten.find_by(params[:id])
		if @kitten.update_attributes(kitten_params)
			flash[:success] = "Kitten updated!"
			redirect_to @kitten
		else
			flash.now[:error] = "Uh oh #{@kitten.errors.messages}"
			render 'edit'
		end 
	end

	def destroy
		@kitten = Kitten.find_by(id:params[:id])
		@kitten.destroy
		flash[:success] = "Kitten destroyed :("
		redirect_to kittens_url
	end

	private
		def kitten_params
			params.require(:kitten).permit(:name, :age, :cuteness, :softness)
		end
end
