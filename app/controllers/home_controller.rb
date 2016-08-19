class HomeController < ApplicationController
  def index
    @posts = Post.all.order("id desc")
  end

  def write
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]
    # Post.create(title :params[:title], content :params[:content]) 
    #위 세줄은 이 한줄로 정리된다.하지만 이런 형식은 seed에서만 거의 쓰이고 작업시에는
    # post = Post.new(title :params[:title], content :params[:content]) 
    #로 많이 사용한다. 앞의것은 너무 극단적으로 짧다.
    post.save
    
    redirect_to '/home/index'
  end
  
  def reply_write
  	reply = Reply.new
  	reply.content = params[:content]
  	reply.post_id = params[:id_of_post]
  	reply.save
  	
  	redirect_to '/home/index'
  end
end
