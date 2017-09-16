class TaskController < ApplicationController

  def index
    @task =Task.all
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task =Task.new
  end
  
  def create
    @task = Task.new(Task_params)

    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private

  def task_params
    params.require(:task).permit(:content)
  end
  

end
