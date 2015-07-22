class PostsController < ApplicationController
	def index
		@posts = Post.includes(:likes).paginate(:page => params[:page], :per_page => 30)
		@comment = Comment.new
	end

	def create
		puts params
		Post.create(post_params)
		redirect_to(:back)
	end

	private

  def post_params
    params.require(:post).permit(:content)
  end
end