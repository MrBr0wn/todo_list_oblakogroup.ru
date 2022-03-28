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
    if !params[:todo][:project].empty?
      @project = Project.new({ title: todo_params[:project] })

      if @project.save!
        @todo = Todo.new(todo_params.except(:project).merge!(project_id: @project.id))
        @todo.save!
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    else
      @todo = Todo.new(todo_params.except(:project))
      render json: @todo.errors, status: :unprocessable_entity unless @todo.save!
    end
    redirect_to '/projects', flash: { alert: 'Item is added!' }
  end

  private

  def todo_params
    params.require(:todo).permit(:text, :isCompleted, :project_id, :project)
  end
end
