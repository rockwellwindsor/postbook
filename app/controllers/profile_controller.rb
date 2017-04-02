# This controller updates the users profile
class ProfileController < ApplicationController
  # Set the user variable
  before_action :set_user
  # PATCH/PUT /profile/1
  # PATCH/PUT /profile/1.json
  def update
    respond_to do |format|

        if @user.update(user_params)
          format.html { redirect_to root_path, notice: "#{@user.first_name} #{@user.last_name}'s profile was successfully updated."}
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end

    end
  end

  private
    # Set user for controller
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
