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

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:tittle, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end

#ejemplo de metodo privado en rails
	private
		def posts_params
			params.require(:post).permit(:tittle, :body)
		end
end
