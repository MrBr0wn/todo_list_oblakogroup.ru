class TodosController < ApplicationController
  def update_todo
    @todo = Todo.find_by(id: params[:id], project_id: params[:project_id])

    #  Будут бить за это :(
    raise ActiveRecord::RecordNotFound if @todo.nil?

    if @todo.update(isCompleted: !@todo.isCompleted)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def create
    if params[:project].present?
      before_action do
        @project = Project.create(params[:project])
      end

      Todo.create(params[:todo], project_id: @project.id)
    else
      Todo.create(params[:todo])
    end
  end

  private

  def todo_params
    params.permit(:id, :text, :project_id, :isCompleted)
  end
end
