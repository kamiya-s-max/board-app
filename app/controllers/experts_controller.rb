class ExpertsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_category, only: [:index, :show]

  def index
    @experts = @category.experts.includes(:user).page(params[:page]).per(12).order("created_at ASC")
  end

  def show
    @expert = Expert.find(params[:id])
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

  def set_category
    @category = Category.find(params[:category_id])
  end
end
