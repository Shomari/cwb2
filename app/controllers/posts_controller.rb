class PostsController < ApplicationController
	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 30)
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