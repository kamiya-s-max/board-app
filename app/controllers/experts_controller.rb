class ExpertsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def new
    @expert = Expert.new
  end
end
