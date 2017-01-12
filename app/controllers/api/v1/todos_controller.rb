class Api::V1::TodosController < ApplicationController
  before_filter :todo, only: %i(update destroy complete uncomplete)

  def index
    render json: { todos: Todo.all }
  end

  def create
    todo = Todo.create(todo_params)

    if todo.save
      render json: { todo: todo }
    else
      render json: { errors: todo.errors.full_messages }, status: 400
    end
  end

  def update
    if @todo.update(todo_params)
      render json: { todo: @todo }
    else
      render json: { errors: @todo.full_messages }, status: 400
    end
  end

  def destroy
    @todo.destroy!

    render json: {}
  end

private

  def todo_params
    params.require(:todo).permit(:title, :completed, :editing)
  end

  def todo
    @todo = Todo.where(id: params[:id]).first!
  end
end
