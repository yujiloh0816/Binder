class Users::Sp::MatchingController < ApplicationController
  def index
    @match_users = Reaction.search_matching_with(current_user).map(&:from_user)
  end
end
