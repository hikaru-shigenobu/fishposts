class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit, :update]
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user    
    # if params[:page_type] == 'search'
    #   @back_url = search_path_path
    # elsif yyyy
    #       @back_url = xxx_path()
    # else
    #   @back_url = root_path
    # end
  end

  def new
     @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'posts/new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Post は正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'Post は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to root_url
  end
  
  def search
    if params[:search].present?
      @posts = Post.where('title::varchar LIKE :word OR date::varchar LIKE :word OR time::varchar LIKE :word OR address::varchar LIKE :word OR whether::varchar LIKE :word OR temperature::varchar LIKE :word OR water_temperature::varchar LIKE :word OR tide::varchar LIKE :word OR fishing_style::varchar LIKE :word OR catch::varchar LIKE :word OR report::varchar LIKE :word', word: "%#{params[:search]}%")
      # @posts = Post.where('title LIKE :word OR date LIKE :word OR time LIKE :word OR address LIKE :word OR whether LIKE :word OR temperature LIKE :word OR water_temperature LIKE :word OR tide LIKE :word OR fishing_style LIKE :word OR catch LIKE :word OR report LIKE :word', word: "%#{params[:search]}%")
      render 'posts/search'
    else
      @posts = Post.none
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:image, :title, :date, :time, :address, :whether, :temperature, :water_temperature, :tide, :fishing_style, :catch, :report)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
  
end
