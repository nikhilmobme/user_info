class UsersController < ApplicationController
  
  def new
    @user=User.new
  end
  
  def edit
    @user=User.find(params[:id])
  end
  
  def show
    if session[:user_id] !=nil
      @user=User.find(params[:id])
    else
      flash[:failure] ="Invalid url"
      redirect_to root_path
    end
  end
  
  def index
    if session[:user_id] !=nil
      @user_auth=User.find(session[:user_id])
      if(@user_auth.email=="admin@gmail.com")
        @user=User.all
      else
        flash[:failure] ="Invalid url"
        redirect_to root_path
      end
    else
      flash[:failure] ="Invalid url"
      redirect_to root_path
    end
  end

  def create
    if User.find_by(:email=>params[:user][:email])
      redirect_to new_user_path
      flash[:failure] ="email already exists"
    else
      @user=User.new(user_params)
      if(@user.save)
        redirect_to login_path
        flash[:success] ="User Registered Successfully"
      else
        render 'new'
       end
    end
  end
 
  def update
    @user=User.find(params[:id])
    if(@user.update(user_params))
      redirect_to users_path 
      flash[:success]="Updated Successfully"
    else
      render 'edit'
    end
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
