class ExpertsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @expert = Expert.new
  end

  def create
    @expert = Expert.new(expert_params)
    if @expert.save
      redirect_to root_path
    else
      render "/experts/new"
    end
  end

  private

  def expert_params
    params.require(:expert).permit(:name,
                                   :career,
                                   :contact,
                                   :text,
                                   :category_id).merge(user_id: current_user.id)
  end
end
