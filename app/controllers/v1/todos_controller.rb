module V1
  class TodosController < ApplicationController
    # [...]
    # GET /todos
    def index
      # get paginated current user todos
      @todos = current_user.todos.paginate(page: params[:page], per_page: 20)
      json_response(@todos)
    end

    # [...]
    # POST /todos
    def create
      # create todos belonging to current user
      @todo = current_user.todos.create!(todo_params)
      json_response(@todo, :created)
    end
    # [...]
    private

    # remove `created_by` from list of permitted parameters
    def todo_params
      params.permit(:title)
    end
    # [...]
  end
end