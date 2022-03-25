class ProjectsController < ApplicationController
  def index
    # render json: { message: 'OK' }

    # @projects = Project.select(:id, :title)
    @projects = Project.all
  end
end
