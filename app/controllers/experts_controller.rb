class ExpertsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_category, only: [:index, :show]
  before_action :find_expert, only: [:show, :edit, :update]

  def index
    @experts = @category.experts.includes(:user).page(params[:page]).per(12).order("created_at ASC")
  end

  def show
  end

  def edit
  end

  def update
    if @expert.user_id == current_user.id
      if @expert.update(expert_params)
        redirect_to "/categories/#{@expert.category_id}/experts", notice: "card update successfully."
      else
        render :edit
      end
    end
  end

  def new
    @expert = Expert.new
  end

  def create
    @expert = Expert.new(expert_params)
    if @expert.save
      redirect_to "/categories/#{@expert.category_id}/experts", notice: "card create successfully."
    else
      render :new
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

  def find_expert
    @expert = Expert.find(params[:id])
  end
end
