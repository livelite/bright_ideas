class IdeasController < ApplicationController
	before_action :authorize_user

	def index
		@ideas = Idea.select('ideas.*, COUNT(likes.id) like_count').joins('LEFT OUTER JOIN likes ON likes.idea_id = ideas.id').group('ideas.id').order('like_count DESC')
	end

	def show
		@idea = Idea.find(params[:id])
	end

	def create
		idea = Idea.new(
				idea_params.merge(
				user: current_user
			)
		)
		if not idea.save
			flash[:form_errors] = idea.errors.full_messages
		end
		redirect_to '/ideas'
	end

	def destroy
		Idea.find(params[:id]).destroy
		redirect_to '/ideas'
	end

	private
		def idea_params
			params.require(:idea).permit(:idea)
		end
end
