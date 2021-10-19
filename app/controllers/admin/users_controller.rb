class Admin::UsersController < ApplicationController
        skip_before_action :login_required, only: [:new, :create]
       def new
           @user = User.new
       end
   
        def index
            if current_user.is_admin
                @users = User.all.where.not(id: current_user.id)
            else
                redirect_to tasks_path, notice:"Vous n'etes pas administrateur"
            end

        end
       def create
           @user = User.new(user_params)
           if @user.save
               redirect_to admin_users_path
           else
               render :new
           end
       end
       def update
            @user = User.find(params[:id])
            if @user.update(user_params) 
                redirect_to admin_users_path
            end
        end
        def show
            @user = User.find(params[:id])
            if current_user != @user.id
                redirect_to tasks_path
            else
                @tasks= @user.tasks.all.page(params[:page]).per(2)
            end
        end
       def edit
        @user = User.find(params[:id])
       end
       
       private
       def user_params
           params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin)
       end
      
end
