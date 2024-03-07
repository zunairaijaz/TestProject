class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = @campaign.todos
  end

  def new
    @todo = @campaign.todos.build
  end

  def create
    @todo = @campaign.todos.build(todo_params)
    if @todo.save
      redirect_to campaign_path(@campaign), notice: "Todo List created Successfully!"
    else
      flash.now[:alert] = 'Failed to create Todo List.'
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @todo.update(todo_params)
      redirect_to campaign_todo_path(@campaign, @todo), notice: "Todo List updated Successfully!"
    else
      flash.now[:alert] = 'Failed to update Todo List.'
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to campaign_path(@campaign), notice: "Todo List deleted Successfully!"
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description)
  end

  def set_campaign
    @campaign = Campaign.find_by(id: params[:campaign_id])
    unless @campaign
      flash[:alert] = 'Campaign not found.'
      redirect_to campaigns_path
    end
  end

  def set_todo
    @todo = @campaign.todos.find(params[:id])
  end
end