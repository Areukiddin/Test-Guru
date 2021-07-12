class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show create update destroy]

  def index
    @badges = Badge.all
  end

  def show; end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
