class OwnBadgesController < ApplicationController
  def index
    @own_badges = current_user.own_badges
  end
end
