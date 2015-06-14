class UsersController < ApplicationController
  before_action :authenticate_user!
  expose_decorated(:user)
  expose_decorated(:reviews) { user.reviews.includes(:product).order(created_at: :desc).paginate(:page => params[:page], :per_page => 5) }

  def show
  end
end
