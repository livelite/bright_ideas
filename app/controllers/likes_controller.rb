class LikesController < ApplicationController
	def create
		Like.create(idea: Idea.find(params[:id]), user: current_user)
		redirect_to '/ideas'
	end

	def destroy
		Like.find_by(idea: Idea.find(params[:id]), user: current_user).destroy
		redirect_to '/ideas'
	end
end
