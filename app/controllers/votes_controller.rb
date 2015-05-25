class VotesController < ApplicationController
  layout false

  before_action :prepare_parent
  before_action :prepare_vote

  def like
    @vote.value = 1
    @vote.save
  end

  def dislike
    @vote.value = -1
    @vote.save
  end

  private

  def prepare_parent
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @parent = $1.classify.constantize.find(value)
      end
    end
  end

  def prepare_vote
    @vote = Vote.find_or_initialize_by(likeable: @parent, user: current_user)
  end
end
