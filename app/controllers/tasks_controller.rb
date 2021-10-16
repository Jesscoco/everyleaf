class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all.order(created_at: :desc).page(params[:page]).per(2)
    @tasks = Task.all.order(ending_date: :desc).page(params[:page]).per(2) if params[:sort_expired] == 'true' 
    @tasks = Task.all.order(priority: :desc).page(params[:page]).per(2) if params[:sort_priority] == 'true' 
      
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: I18n.t('views.messages.create_task') }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: I18n.t('views.messages.update_task') }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  def search
    session[:search] = {
          'name' => params[:search_title],
          'status' => params[:search_status],
          'priority' => params[:search_priority]
        }
   
    if params[:search_title].present?
      if params[:search_status].present?
        if params[:search_priority].present?
          @tasks = Task.all.search_by_title(params[:search_title]).search_by_status(params[:search_status]).search_by_priority(params[:search_priority]).kaminari params[:page] 
        else
          @tasks = Task.all.search_by_title(params[:search_title]).search_by_status(params[:search_status]).kaminari params[:page] 
        end
      elsif params[:search_priority].present?
        @tasks = Task.all.search_by_title(params[:search_title]).search_by_priority(params[:search_priority]).kaminari params[:page] 
      else
        @tasks = Task.all.search_by_title(params[:search_title]).kaminari params[:page] 

      end
    elsif params[:search_status].present?
      
      if params[:search_priority].present?
        @tasks = Task.all.search_by_status(params[:search_status]).search_by_priority(params[:search_priority]).kaminari params[:page] 
      else
        @tasks = Task.all.search_by_status(params[:search_status]).kaminari params[:page] 
      end
    elsif params[:search_priority].present?
      
      if params[:search_status].present?
        @tasks = Task.all.search_by_priority(params[:search_priority]).search_by_status(params[:search_status]).kaminari params[:page] 
      else
        @tasks = Task.all.search_by_priority(params[:search_priority]).kaminari params[:page] 
      end
    else
      @tasks = Task.all.kaminari params[:page]
    end
    @tasks = Task.all.kaminari params[:page]

    # @labels = Label.where(user_id: nil).or(Label.where(user_id: current_user.id))
    render :index
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: I18n.t('views.messages.delete_task') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :content, :ending_date, :status, :priority)
    end
end
