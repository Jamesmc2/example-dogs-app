class DogsController < ApplicationController
  def create
    if current_user
      dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed],
        user_id: current_user.id,
      )
      dog.save
      render json: { success: "Dog added to database" }
    else
      render json: { error: "Must be logged in" }
    end
  end
end
