class UsersController < ApplicationController

  def login

  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def login_form
    @user = User.find_by(email: params[:email],
                         password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインに成功しました"
      redirect_to("/posts/index")
    else
      render("users/login")
    end
  end

  def new

  end

  def create
    @user = User.new(name: params[:name],
                     email: params[:email],
                     password: params[:password],
                     image: "default_user.jpg")

    if @user.save
      session[:use_id] = @user.id
      flash[:notice] = "ようこそ！！"
      redirect_to("/posts/index")
    else
      render("users/new")
    end

    # if params[:image]
    #   @user = User.find_by(email: params[:email])
    #   @user.image = "#{@user.id}.jpg"
    #   File.binwrite("public/user_images/#{@user.image}", params[:image].read)
    # end
  end

  def mypage
    @user = User.find_by(id: session[:user_id])
  end

end
