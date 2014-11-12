class VotesController < ApplicationController
	def create
			@story = Story.find(params[:story_id])
			@vote = @story.votes.new(story_id: @story.id)
			@vote.ip_address = request.remote_ip

		if @vote.save
			flash[:success] = "Thanks for voting"
			redirect_to story_path(@story)
		else
			flash[:error] = "Oops, sorry, something went wrong with your vote"
			redirect_to root_path
		end
	end

end
