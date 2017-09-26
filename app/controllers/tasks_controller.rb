class TasksController < ApplicationController

  def index
    @tasks =Task.all.page(params[:page])
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task =Task.new
  end
  
  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Task が正常に編集されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が編集されませんでした'
      render :new
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_url
  end
  
  private

  def task_params
    params.require(:task).permit(:content, :status)
  end
end
