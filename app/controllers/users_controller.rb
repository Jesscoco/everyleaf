class UsersController < ApplicationController
     skip_before_action :login_required, only: [:new, :create]
    def new
        @user = User.new
        if current_user
            redirect_to tasks_path
        else
            @user = User.new
        end

    end
    def update
        @user = User.find(params[:id])
        @user.update(user_params) 
        if @user.save
            redirect_to user_path
        end
    end

    def edit
        @user = User.find(params[:id])
   end
    def index
    
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_users_path            
    
    end

    def create
        @user = User.new(user_params)
        if @user.save     
            session[:user_id] = @user.id
            redirect_to tasks_path

        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])

        if current_user.id != @user.id 
            redirect_to tasks_path
                    
        elsif current_user.is_admin != true && current_user.id != @user.id
            redirect_to tasks_path

        end  
            
            @tasks= @user.tasks.all.page(params[:page]).per(2)
        
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
