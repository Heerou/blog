class Post < ActiveRecord::Base
	#validaciones que hace siempre y cuando haya algo nuevo
	validates :tittle, presence: true, length: {minimum: 5}
	validates :body, presence: true 
end
