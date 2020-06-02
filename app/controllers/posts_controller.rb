class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    # @user  = User.find_by(id: @posts.user_id)
  end
  def show
    @id = params[:id]
    @post = Post.find_by(id:@id)
  end

  def new
     @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content], user_id: session[:user_id])
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @id = params[:id]
    @post = Post.find_by(id:@id)
  end

  def update
    @id = params[:id]
    @post = Post.find_by(id:@id)
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def delete
    @id = params[:id]
    @post = Post.find_by(id:@id)
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

end
