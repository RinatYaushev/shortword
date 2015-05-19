class VotesController < ApplicationController
  def like
    get_vote
    @vote.value += 1 unless @vote.value == 1
    @vote.save
    respond_to do |format|
      format.html { redirect_to root_path, notice: t('.like_notice') }
      format.js
    end
  end

  def dislike
    get_vote
    @vote.value -= 1 unless @vote.value == -1
    @vote.save
    respond_to do |format|
      format.html { redirect_to root_path, alert: t('.dislike_notice') }
      format.js
    end
  end

  private

  def get_vote
    current_item = Post.find(params[:post_id].to_i)
    @vote = current_item.votes.find_by_user_id(current_user.id)
    unless @vote
      @vote = Vote.create(user_id: current_user.id, value: 0)
      current_item.votes << @vote
    end
  end

end
