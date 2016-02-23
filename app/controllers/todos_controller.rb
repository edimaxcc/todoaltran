class TodosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :current_user, only: [:destroy]
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
	
  def index
    #if current_user.admin?
  		@todos = Todo.all
      if user_signed_in?
      @user_todos = Todo.where(user_id: current_user, done: false )
      @done_todos = Todo.where(user_id: current_user, done: true ) 
    #end 
   end
  end

    def new
    @todo = Todo.new
    end
     
    

  def create
  @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to @todo, notice: 'Post was successfully created.'
    else
      flash[:notice] = "Please Write something"
      render :new
    end
  end

  
  def edit
    authorize! :update, @todo
  end
  
  def update
  @todo = Todo.find(params[:id]) 
    if current_user.id == @todo.user.id
     if @todo.update(todo_params)
      redirect_to @todo, notice: 'Todo was successfully updated.'
     else 
      format.html { render :edit }
      format.json { render json: @todo.errors, status: :unprocessable_entity }
     end
   end
  end
 
  def destroy
   @todo = Todo.find(params[:id])
   @todo.destroy   
    redirect_to todos_path, notice: 'Todo was successfully Deleted.'
  end


  def show
  	@todo = Todo.find(params[:id])
    authorize! :update, @todo
  end
  
  private

  def set_todo
    @todo = Todo.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def todo_params
    params.require(:todo).permit(:description, :user_id, :done) 
  end
end
