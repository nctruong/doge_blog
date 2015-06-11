class CommentsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@comment.post) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post)
      flash[:success] = 'Comment Updated!'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'Comment Deleted!'
    redirect_to post_path(@comment.post)
  end

  def vote
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    vote = Vote.find_by(voteable: @comment, user_id: current_user.id)
    if vote == nil
      Vote.create(voteable: @comment, user_id: current_user.id, upvote: params[:upvote])
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
  def comment_params
    params.require(:comment).permit(:comment_text)
  end

end
