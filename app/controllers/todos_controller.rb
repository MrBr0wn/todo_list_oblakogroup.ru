class TodosController < ApplicationController
  def update_todo
    @todo = Todo.find_by(id: params[:id], project_id: params[:project_id])

    #  Будут бить за это :(
    raise ActiveRecord::RecordNotFound if @todo.nil?

    if @todo.update(isCompleted: !@todo.isCompleted)
      render json: { todo: @todo, status: 'OK' }, status: 200
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def create
    if false
      @project = Project.new(todo_params[:project])
      # Todo.create(params[:todo], project_id: @project.id)
    else
      todo = Todo.new(todo_params)
      todo.save!
    end
    redirect_to '/projects', flash: { alert: 'Item is added!' }
  end

  private

  def todo_params
    params.require(:todo).permit(:text, :isCompleted, :project_id)
  end
end
