class VotesController < ApplicationController
  before_filter :load_voteable

  def create
    @vote = @voteable.votes.new(params[:vote])
    redirect_to posts_path(@post)
  end

  def destroy
  end

  private

  def load_voteable
    resource, id = request.path.split('/')[1,2]
    @voteable = resource.singularize.classify.constantize.find(id)
  end

end
