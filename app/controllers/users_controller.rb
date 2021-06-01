class UsersController < ApplicationController
  # all the actions done by devise
  # def show
  #   @user = User.find(params[:id])
  # end

  # def edit
  #   @users = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #     if @user.update_attributes(user_params)
  #       flash[:success] = "User was successfully updated"
  #       redirect_to @user
  #     else
  #       flash[:error] = "Something went wrong"
  #       render 'edit'
  #     end
  # end

  # private

  # def user_params # do we wanna remove somethung? or add?
  #   params.require(:user).permit(:email, :first_name, :last_name, :location, :date_of_birth)
  # end
end

