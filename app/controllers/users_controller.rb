class UsersController < ApplicationController
  def edit_profile
    @user= User.find(params[:id])
    if request.get?
    else
      @user.update_attributes(params[:user])
      redirect_to show_profile_path(@user.id)
    end
  end
  def show
    @user= User.find(params[:id])
  end
def change_password
if request.put?
if current_user.valid_password?(params[:user][:old_password])
 puts "shubham1*********************"
      if params[:user][:password]==params[:user][:password_confirmation]
  current_user.password=params[:user][:password]
   if current_user.save
   redirect_to show_profile_path(current_user)
   puts "shubham*********************"
   flash[:notice]="password changed successfully"
        else
     flash[:notice]="password change is unsuccessful"
    end
   end
 end
end

  end
def all_user
#@user=User.all
users = []
users << current_user.id
users << current_user.friends.map(&:friend_id)
users.flatten!
  @users=User.where(["id NOT IN (?)",(users)])
 respond_to  do |format|
      format.html
      format.js
    end
end
end
