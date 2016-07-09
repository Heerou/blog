class PostsController < ApplicationController

#accion en el controlador
	def index
		@post = Post.all.order("created_at DESC")		
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(posts_params)
		
		#Si se guarda redirige al post, sino te vuelve al new con lo que tenias
		if (@post.save)
			redirect_to @post
		else
			render 'new'	
		end
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
