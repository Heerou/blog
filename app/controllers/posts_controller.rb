class PostsController < ApplicationController

#accion en el controlador
	def index
		@post = Post.all.order("created_at DESC")		
	end

	def new
	end

	def create
		@post = Post.new(posts_params)
		@post.save

		redirect_to @post
	end

	def show
		@post = Post.find(params[:id])
	end

#ejemplo de metodo privado en rails
	private
		def posts_params
			params.require(:post).permit(:tittle, :body)
		end
end
