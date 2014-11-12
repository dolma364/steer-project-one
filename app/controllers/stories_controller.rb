class StoriesController < ApplicationController

	def index
		if params[:sort] and params[:sort] == "top"
			@stories = Story.order("votes_count DESC")
		
		elsif params[:is_featured] and params[:is_featured] == "true"
			@stories = Story.where(is_featured: true)

		else @stories = Story.order("created_at DESC")
		
		end


	
	end


	def show
		@story = Story.find(params[:id])
		@votes = @story.votes
	end

	def new
		@story = Story.new
	end

	def create
		@story = Story.new(story_params)
		
		if @story.save
			flash[:success] = "Thanks for sharing"
			redirect_to story_path(@story)
		else
			flash[:error] = "Oops, sorry, something went wrong"
			render :new
		end

	end

	def edit
		@story = Story.find(params[:id])
	end

	def update
		@story = Story.find(params[:id])
	
		if @story.update(story_params)
			flash[:success] = "Thanks, your story was updated"
			redirect_to story_path(@story)
		else
			flash[:error] = "Oops, sorry, something went wrong"
			render :edit
		end

	end

	def destroy
	end

private
def story_params
	params.require(:story).permit(:title, :body, :url, :author)
end

end