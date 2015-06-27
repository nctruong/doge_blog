class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.search(params[:q]).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "Post Added!"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'Post Successfully Updated!'
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.destroy
      flash[:success] = 'Post Successfully Deleted!'
      redirect_to posts_path
    else
      flash[:danger] = "Not So Fast!"
      redirect_to posts_path
    end
  end

  def vote
    @post = Post.find(params[:post_id])
    vote = Vote.find_by(voteable: @post, user_id: current_user.id)
    if vote == nil
      Vote.create(voteable: @post, user_id: current_user.id, upvote: params[:upvote])
      redirect_to post_path(@post)
      flash[:success] = "Voted!"
    else
      vote.assign_attributes(upvote: params[:upvote])
      if vote.changed?
        vote.save
        redirect_to post_path(@post)
        flash[:success] = "Vote Updated!"
      else
        redirect_to post_path(@post)
        flash[:danger] = "You may upvote or downvote once!"
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :post_text)
  end
end
