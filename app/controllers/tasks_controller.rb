class TasksController < ApplicationController
  before_action :set_column

  def new
    @task = @column.tasks.build
  end

  def create
    @task = @column.tasks.build(task_params)
    if @task.save
      redirect_to column_path(@column), notice: "Task created."
    else
      render :new
    end
  end

  private

  def set_column
    @column = Column.find(params[:column_id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end