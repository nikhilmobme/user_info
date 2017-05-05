class SessionsController < ApplicationController
 
  def new
  end
 
  def create 
    if @user=User.find_by(email: params[:email])
  	  if @user.password == params[:password]
  		  session[:user_id]=@user.id
  		  if @user.email=="admin@gmail.com"
  			  redirect_to users_path
  		  else
         flash[:success] ="user successfully logged in"
  		   redirect_to  welcome_path
  	    end
  	  else 
  		  flash.now[:failure] =" password is not match"
        render 'new'
       end
  	else
      flash.now[:failure] =" username is not match"
	    render 'new'
  	end
  end
  
  def destroy 
    session[:user_id]=nil
    flash.now[:success]="user is successfully logged out"
    redirect_to  root_path
  end
end
